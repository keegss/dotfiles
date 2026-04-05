# Global Instructions

## Code Review Rules
- NEVER post review comments on GitHub pull requests. Always output review results in the conversation only.
- When running code reviews, present findings directly in the chat — do not use `gh` or bbgithub APIs to create comments or reviews on PRs.

## Learned Preferences
- **[Bash]** Avoid compound Bash commands (chained with `;`, `&&`, `||`). Break them into separate calls that each match a single permission pattern, or prefer dedicated tools (Read, Glob, Grep) over Bash when possible.
- **[Git]** Never include "Co-Authored-By: Claude" or any Claude/AI attribution in commit messages.