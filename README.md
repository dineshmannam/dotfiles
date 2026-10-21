# dotfiles

This repository contains my macOS setup.
[GNU Stow](https://www.gnu.org/software/stow/) links the files into the home folder.
Each top-level folder is one Stow package.
The structure of each package is the same as the structure of `$HOME`.

| Package | Target | Contents |
| --- | --- | --- |
| `zsh` | `~/.zshenv`, `~/.config/zsh/` | The zsh configuration (`ZDOTDIR=~/.config/zsh`). Topic files are in `conf.d/`. The prompt is Powerlevel10k Lean. |
| `nvim` | `~/.config/nvim/` | LazyVim with the Python, Terraform, YAML, JSON, Markdown and TypeScript extras. |
| `aerospace` | `~/.config/aerospace/` | The AeroSpace tiling window manager. |
| `wezterm` | `~/.config/wezterm/` | The WezTerm terminal. It uses the Rosé Pine Moon colors, Hack Nerd Font and a transparent background. A window that does not have focus fades. |
| `agents` | `~/.agents/skills/`, `~/.agents/.skill-lock.json` | The agent skills (the `npx skills` store). Claude Code uses them through symbolic links. |
| `claude` | `~/.claude/CLAUDE.md` | The global Claude Code instructions. This file loads my preferences from a private repository. Change the path in this file to your own preferences file, or do not link this package. |

The `Brewfile` contains only the tools that I selected.

## Set up a new Mac

1. Install Homebrew from <https://brew.sh>.
2. Clone this repository to `~/dotfiles`.
3. Install the tools:

   ```zsh
   brew bundle --file ~/dotfiles/Brewfile
   ```

4. Move the existing configuration files to a different location, for example `~/.zshrc` and `~/.config/nvim`.
   If you do not move them, Stow stops and does not link the packages.
5. Link the packages:

   ```zsh
   cd ~/dotfiles && stow zsh nvim aerospace wezterm agents claude
   ```

6. Make the link from Claude Code to the shared skills:

   ```zsh
   mkdir -p ~/.claude/skills && for d in ~/.agents/skills/*; do ln -sfn "../../.agents/skills/$(basename "$d")" ~/.claude/skills/; done
   ```

7. Install the `kun` skill with `npx skills add kunchenguid/kun`.
   This repository does not contain the `kun` skill because its source has no license.
8. Open a new terminal.
9. Start `nvim` one time. LazyVim then installs its plugins.
10. Give AeroSpace the Accessibility permission in System Settings.
    Do this step again after each AeroSpace upgrade.

## Private setup

Only my machines use this section.
The `claude` package loads `~/personal/memory/preferences.md`.
This file is in my private memory repository.
On a new machine, set up access to my personal GitHub account and clone the memory repository to `~/personal/memory`.
My private notes contain the steps.

## Files to make by hand

This repository does not contain these files:

- `~/.config/zsh/local.zsh`. This file contains the aliases, logins and secrets for one machine. Git ignores this file.
- `~/.gitconfig` and `~/.config/git/ignore`.
- A Nerd Font for the prompt and file icons. Set the font in the terminal.
- `~/.claude/skills/synced/`. Claude.ai sync controls this folder. Do not add it to this repository.

## Daily tasks

- When you start to use a new tool, add one line for it to the `Brewfile`.
- Before you install an agent skill, decide if all sessions need it or only one project needs it.
  - A global skill loads in all sessions. This includes agent tools that have their own rules for plans, tests and releases. Thus, keep the `agents` package small.
  - Put a skill for only some repositories in the `.claude/skills/` folder of that project. Or, install it as a plugin at project or local scope (`/plugin install`).
  - A skill bundle with fixed rules for plans, tests or releases is a project skill by default.
  - If you are not sure, install the skill at project level first. Move it to this package only when all sessions need it.
- `npx skills add` puts a new global skill in this repository through the symbolic link. Do these steps:
  1. Run `git status`.
  2. Commit the new skill.
  3. Link the skill into Claude Code (step 6 of the setup), or select Claude Code in the installer.
- Run `ls -la ~/.agents`. If `.skill-lock.json` has no arrow, a tool replaced the symbolic link. Do these steps:
  1. Move the file back into `agents/.agents/`.
  2. Run `stow agents` again.
- Commits in this repository use my GitHub noreply email. This email is set in the local configuration of this repository.
- Do not put information about my employer or clients in this repository. This repository is public.
