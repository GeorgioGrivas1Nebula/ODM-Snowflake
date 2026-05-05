# ODM Snowflake

This repository contains Snowflake DDL and SQL stored procedures for the `OneView` domain.

## Project Layout

- `OneView/Common/Common.sql` creates the `Common` schema.
- `OneView/Organisation/Organisation.sql` creates the `Organisation` schema.
- `OneView/<Schema>/Tables/` contains table DDL.
- `OneView/<Schema>/Stored Procedures/` contains load procedures.
- `OneView/<Schema>/File Formats/` and `Stages/` contain Snowflake file format and stage objects.

Use nearby files as the primary source of truth for object names and SQL style.

## Working Conventions

- Keep Snowflake object names schema-qualified in DDL and procedure bodies.
- Match the repository's file-to-object pattern:
  - tables: `<Schema>.<Entity>.sql`
  - staging tables: `<Schema>.Staging_<Entity>.sql`
  - load procedures: `SP_LOAD_<ENTITY>.sql`
  - staging load procedures: `SP_LOAD_<ENTITY>_STAGING.sql`
- Preserve the established stored procedure shape unless the surrounding files show a different pattern:
  - `CREATE OR ALTER PROCEDURE <name>()`
  - `RETURNS VARCHAR`
  - `LANGUAGE SQL`
  - `EXECUTE AS OWNER`
  - procedure body wrapped in a single-quoted `BEGIN ... END` block
- In target tables, keep surrogate `_ID` keys and audit columns when the neighboring table already uses that pattern.
- In staging tables, mirror source columns closely and avoid adding surrogate keys unless the staging area already does so.
- Keep `MERGE` match keys, `INSERT` columns, and `COPY INTO` targets explicit.

## Pitfalls

- Verify exact object and column names across every touched file before editing. This repo already contains naming drift such as `STAGE_LANGUAGE` vs `STAGING_LANGUAGE` and `OneViewLanguageID` vs `OneViewLanguageId`.
- Do not normalize casing or rename identifiers as incidental cleanup. Only change names when the task explicitly requires it and update every dependent object in the same slice.
- No local build or test automation is visible in the workspace. Treat Snowflake compilation in the target environment as the runtime validation step.

## Validation

- For any schema object change, inspect the corresponding table, staging table, and both load procedures together.
- For staged file loads, confirm the stage path, file format, and column-name matching behavior align with the neighboring files.
- If executable validation is needed, run the changed SQL in Snowflake rather than assuming local tooling exists.

## Reference Files

- [OneView/Common/Common.sql](OneView/Common/Common.sql)
- [OneView/Organisation/Organisation.sql](OneView/Organisation/Organisation.sql)
- [OneView/Common/Tables/Common.Language.sql](OneView/Common/Tables/Common.Language.sql)
- [OneView/Common/Tables/Common.Staging_Language.sql](OneView/Common/Tables/Common.Staging_Language.sql)
- [OneView/Common/Stored Procedures/SP_LOAD_LANGUAGE_STAGING.sql](OneView/Common/Stored Procedures/SP_LOAD_LANGUAGE_STAGING.sql)
- [OneView/Common/Stored Procedures/SP_LOAD_LANGUAGE.sql](OneView/Common/Stored Procedures/SP_LOAD_LANGUAGE.sql)
- [OneView/Common/File Formats/Parquet_Format.sql](OneView/Common/File%20Formats/Parquet_Format.sql)