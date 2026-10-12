# dotfiles

Personal macOS setup, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Each top-level folder is a stow package that mirrors `$HOME`.

| Package | Links into | What |
| --- | --- | --- |
| `zsh` | `~/.zshenv`, `~/.config/zsh/` | zsh (`ZDOTDIR=~/.config/zsh`), topic files in `conf.d/`, Powerlevel10k Lean prompt |
| `nvim` | `~/.config/nvim/` | LazyVim with Python, Terraform, YAML, JSON, Markdown, TypeScript extras |
| `aerospace` | `~/.config/aerospace/` | AeroSpace tiling window manager |
| `agents` | `~/.agents/skills/`, `~/.agents/.skill-lock.json` | Agent skills (the `npx skills` store), shared with Claude Code through symlinks |

`Brewfile` holds hand-picked tools only. `TODO.md` holds parked ideas.

## Set up a new Mac

1. Install Homebrew from <https://brew.sh>.
2. Clone this repo to `~/dotfiles`.
3. Install the tools:

   ```zsh
   brew bundle --file ~/dotfiles/Brewfile
   ```

4. Link the packages (move any existing `~/.zshrc`, `~/.config/nvim` and similar out of the way first, or stow refuses):

   ```zsh
   cd ~/dotfiles && stow zsh nvim aerospace agents
   ```

5. Point Claude Code at the shared skills:

   ```zsh
   mkdir -p ~/.claude/skills && for d in ~/.agents/skills/*; do ln -sfn "../../.agents/skills/$(basename "$d")" ~/.claude/skills/; done
   ```

6. Open a new terminal, then run `nvim` once so LazyVim installs its plugins.
7. AeroSpace: grant Accessibility in System Settings (again after each upgrade).

## Recreate by hand (never committed)

- `~/.config/zsh/local.zsh`: machine-specific and work-only aliases, logins and secrets. Git-ignored on purpose.
- `~/.gitconfig` and `~/.config/git/ignore`: not tracked yet (see `TODO.md`).
- A Nerd Font for prompt and file icons, set in the terminal.
- `~/.claude/skills/synced/`: managed by Claude.ai sync. Never track it.

## Day to day

- New tool adopted: add one line to `Brewfile`.
- Before installing an agent skill, ask "every session, or just this project?".
  Global skills load everywhere, including in agent tools that have their own rules for planning, testing and shipping, so keep this package small.
  A skill for some repos goes in that project's `.claude/skills/`, or in a plugin installed at project or local scope (`/plugin install`).
  Bundles with opinions on how to plan, test or ship are project-level by default.
  When unsure, start at project level and promote a skill here only once it has earned it.
- New global agent skill installed with `npx skills add`: it lands in this repo through the symlink. Run `git status`, commit it, and link it into Claude (step 5, or tick Claude Code in the installer).
- If `ls -la ~/.agents` shows `.skill-lock.json` without an arrow, a tool replaced the symlink: move the file back into `agents/.agents/` and re-run `stow agents`.
- Commits here use the personal email (set repo-locally).
