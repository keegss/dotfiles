---
description: Review a pull request using the code-review agent
---

Review the given pull request using the `code-review` agent.

Parse the PR identifier from the argument:
- **PR number only**: `/code-review 123` (infer repo from current directory or ask)
- **Repo and PR**: `/code-review owner/repo/123`
- **Full URL**: `/code-review https://github.com/owner/repo/pull/123`

Launch the `code-review` agent with the parsed PR details.

Present the agent's findings to the user. Only post the review to GitHub if the user explicitly asks.