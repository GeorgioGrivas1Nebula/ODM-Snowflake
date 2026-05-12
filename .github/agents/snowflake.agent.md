---
name: snowflake
description: "Use when working on Snowflake tables, staging tables, stages, file formats, COPY INTO loads, and SQL stored procedures in this repository. Applies ODM Snowflake conventions for Common/Organisation schemas, table DDL, staging patterns, and SP_LOAD_* stored procedures."
---

# Snowflake Conventions

Use this skill when creating or updating Snowflake SQL in this repository.

## Repository Patterns

Follow the existing OneView structure:

- Tables are schema-qualified, for example `Common.Language`
- Staging tables are schema-qualified and named `Common.Staging_<Entity>`
- Stored procedures are named `SP_LOAD_<ENTITY>` and `SP_LOAD_<ENTITY>_STAGING`
- Stored procedures use:
  - `CREATE OR ALTER PROCEDURE <name>()`
  - `RETURNS VARCHAR`
  - `LANGUAGE SQL`
  - `EXECUTE AS OWNER`

## Table Conventions

When creating target tables:

- Use `CREATE OR ALTER TABLE  <Schema>.<Table>`
- Include `_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER` as the surrogate key on target tables when the pattern already exists for that entity
- Keep source-system identifiers as explicit business columns such as `OneViewLanguageId`
- Preserve the repo's audit and soft-delete columns when relevant:
  - `_InsertedById`     
  - `_InsertedDate`     
  - `_UpdatedById`      
  - `_UpdatedDate`      
  - `_IsDeleted`  
- Use the existing column naming and casing patterns already present in neighboring files
- Add `primary key (_ID)` when the table uses the surrogate key pattern

When creating staging tables:

- Use `CREATE OR ALTER TABLE <Schema>.Staging_<Entity>`
- Do not add `_ID` autoincrement columns unless the existing pattern for that staging area explicitly requires it
- Mirror source columns closely to support `COPY INTO` and merge procedures

## Stored Procedure Conventions

When creating load procedures:

- Use one procedure to load staging from the Snowflake stage:
  - `SP_LOAD_<ENTITY>_STAGING`
- Use one procedure to merge staging into the target table:
  - `SP_LOAD_<ENTITY>`

For staging load procedures:

- Use `COPY INTO <Schema>.STAGING_<ENTITY>` or match the repo's actual object naming for that entity
- Prefer explicit source stage paths
- For Parquet loads, use a named file format or an approved inline format only where Snowflake syntax supports it
- Use `MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE` when the staged file layout supports it
- Use `ON_ERROR = CONTINUE` and `PURGE = TRUE` only if that matches the established load behavior for the surrounding area

For merge procedures:

- `MERGE INTO <target> as T`
- `USING (...) S`
- Match on the business key from the source system, not `_ID`
- Update only changed columns
- Preserve soft-delete handling through `_DeletedBit`
- Keep inserted column lists explicit

## Stage and File Format Guidance

For querying staged Parquet files:

- Use a named file format object for staged-file SELECT statements when needed
- Example query shape:

```sql
SELECT
    t.$1,
    METADATA$FILENAME
FROM @ONEVIEW_STAGE/admin/languages
(
    FILE_FORMAT => COMMON.PARQUET_FORMAT,
    PATTERN => '.*[.]parquet'
) t;