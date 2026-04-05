---
name: remember
description: Persist a learned preference to CLAUDE.md and push to dotfiles repo
argument: The preference to remember
---

# Remember

Persist a learned preference to the Learned Preferences section of CLAUDE.md and push to the dotfiles repo.

## Determine dotfiles path

**Before doing anything else**, detect the dotfiles repo:

```bash
if [ -d /root/dotfiles/.claude ]; then echo "/root/dotfiles"
elif [ -d "$HOME/dotfiles/.claude" ]; then echo "$HOME/dotfiles"
fi
```

Store the result as `$DOTFILES` for all steps below. If neither exists, tell the user and stop.

## Steps

1. **Format the preference** as a concise bullet point. Add a category tag if applicable: `**[Python]**`, `**[Go]**`, `**[C++]**`, `**[Git]**`, `**[Testing]**`, `**[Bloomberg]**`, `**[Style]**`, etc.

2. **Check for duplicates** — read `$DOTFILES/.claude/CLAUDE.md` and verify the preference (or something equivalent) is not already documented anywhere in the file. If it is, tell the user and stop.

3. **Pull latest**:
   ```bash
   git -C "$DOTFILES" pull --rebase origin main
   ```
   If this fails with a conflict, run `git -C "$DOTFILES" rebase --abort`, tell the user, and stop.

4. **Append the preference** — using the Edit tool, add the new bullet point at the end of the `## Learned Preferences` section in `$DOTFILES/.claude/CLAUDE.md`. Format: `- **[Category]** Preference text`

5. **Commit and push**:
   ```bash
   git -C "$DOTFILES" add .claude/CLAUDE.md && \
   git -C "$DOTFILES" commit -m "claude: remember \"<short summary>\"" && \
   git -C "$DOTFILES" push origin main
   ```

6. **Report back** — tell the user what was added and confirm it was pushed.

No `cp` step is needed — on Mac, stow symlinks `~/.claude/` to the dotfiles repo; on Spaces, the dotfiles setup creates the same symlinks. Editing the repo copy updates the live copy automatically.

## Error Handling

- **Git conflict**: Abort rebase, inform user
- **Push rejected**: Pull --rebase and retry once. If still fails, inform user.
- **Missing section header**: If `## Learned Preferences` is not found, tell the user the CLAUDE.md structure is unexpected and stop.
