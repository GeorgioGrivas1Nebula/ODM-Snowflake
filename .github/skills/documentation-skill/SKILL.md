---
name: documentation-skill
description: 'Draft realistic, readable, informative Confluence-ready documentation from a feature, bugfix, refactor, deployment, or operational change description. Use for writing change summaries, feature docs, bugfix notes, release updates, and project documentation before publishing to Confluence.'
argument-hint: 'Describe the change, intended audience, and any facts the documentation must include.'
---

# Documentation Skill

Use this skill to turn a rough change description into documentation that reads like an internal engineering page instead of a generic template.

## When To Use
- The user wants documentation for a feature, bugfix, refactor, deployment, release, or operational change.
- The output needs to be readable in Confluence markdown.
- The change description is partial and needs a sensible structure chosen for it.

## Inputs To Collect
- A page title or working title.
- What changed.
- Why it changed.
- Who the audience is.
- Any concrete details that must be preserved, such as endpoints, services, risks, rollout steps, or validation notes.

If a critical fact is missing, ask for it. If the detail is optional, draft with the facts available and call out assumptions plainly.

## Procedure
1. Classify the change before drafting.
   Use [change classification](./references/change-classification.md) to decide whether the request is primarily a feature, bugfix, or general change.
2. Choose the lightest useful outline.
   Start from one of these assets and keep only the sections supported by the available facts:
   - [feature outline](./assets/feature-change-outline.md)
   - [bugfix outline](./assets/bugfix-change-outline.md)
   - [general change outline](./assets/general-change-outline.md)
3. Write for the real audience.
   Follow [Confluence writing guidelines](./references/confluence-writing-guidelines.md) so the draft reads like internal project documentation, not release marketing.
4. Prefer factual prose over filler.
   Keep the draft specific. Replace vague claims with observable behavior, implementation detail, rollout notes, constraints, or validation outcomes.
5. Keep the markdown ready for `confluence create-child --format markdown`.
   Do not add YAML frontmatter. Do not add an H1 that duplicates the page title, because the publishing command already supplies the title.
6. Return a complete draft.
   The result should be directly publishable after a quick human review.

## Drafting Rules
- Adapt the structure to the change type; do not force every heading into every page.
- Use concise section headings.
- Call out impact, dependencies, and risks when they materially affect readers.
- Distinguish confirmed facts from assumptions.
- If the change is technical and user-facing, cover both behavior and implementation at a high level.
- When rollout or validation matters, include a short verification section.

## Output Expectations
- Output plain markdown only.
- Keep the tone direct and informative.
- Make the first paragraph stand on its own as a useful summary.
- End with a short validation, rollout, or follow-up section when relevant.