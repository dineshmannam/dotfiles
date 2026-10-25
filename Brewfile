# Tools chosen on purpose for this Mac. Rebuild with: brew bundle --file ~/dotfiles/Brewfile
# Add a line only when a tool is adopted; this is not a dump of everything installed.

tap "nikitabobko/tap"
tap "felixkratz/formulae"
tap "hashicorp/tap"
tap "adamrodger/tap"
tap "stripe/stripe-cli"

# Shell and dotfiles
brew "stow"
brew "zoxide"
brew "fd"
brew "direnv"
brew "fzf"
brew "ripgrep"  # content search; LazyVim <space>/ needs it
brew "bat"  # syntax-highlighted previews
brew "eza"  # ls with icons and git status; ll/la/tree aliases need it
brew "powerlevel10k"  # prompt theme; .zshrc sources it
brew "zsh-autosuggestions"  # .zshrc sources it
brew "zsh-syntax-highlighting"  # .zshrc sources it

# Window management and terminal
cask "nikitabobko/tap/aerospace"
brew "felixkratz/formulae/borders"
cask "wezterm"
cask "font-hack-nerd-font"  # icons in the prompt and eza

# Editor
brew "neovim"
brew "tree-sitter-cli"  # LazyVim installs language parsers with it
brew "lazygit"  # <space>gg in LazyVim

# Git and tracking
brew "gh"
cask "openusage"  # AI usage tracker for Claude Code, Codex and others

# Cloud
cask "gcloud-cli"
brew "adamrodger/tap/gctx"
brew "hashicorp/tap/terraform"
cask "docker-desktop"

# Languages and platforms
brew "python@3.12"
brew "uv"
brew "node"
brew "fnm"  # per-folder Node versions from .nvmrc
brew "pyenv"  # per-folder Python versions from .python-version
brew "sf"

# Testing and payments
brew "toxiproxy"  # simulate network faults for resilience tests
brew "k6"  # load tests from JavaScript scripts
brew "httpie"  # readable HTTP requests from the terminal
brew "stripe/stripe-cli/stripe"  # Stripe API, webhooks and events from the terminal
