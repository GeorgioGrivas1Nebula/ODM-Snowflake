Write for an internal engineering audience.

Style rules:
- Lead with the most useful facts.
- Prefer short paragraphs over bullet-heavy filler.
- Use bullets when enumerating behavior, risks, dependencies, or validation steps.
- Avoid promotional language, vague benefits, and claims that are not supported by the change description.
- Name the concrete system components when they matter.

Confluence markdown guidance:
- The page title is provided separately by the publishing command, so do not start with an H1 heading.
- Use H2 and H3 headings only when they improve scanability.
- Keep tables optional; prefer prose unless the comparison is clearer in a table.
- Use fenced code blocks for commands, payloads, and config snippets.

Quality checks before returning a draft:
- The first paragraph explains the change without requiring the rest of the page.
- Each section has a clear purpose.
- The draft avoids placeholders like "TBD" unless the user explicitly asked for them.
- Validation or rollout notes are included when the change would be risky without them.