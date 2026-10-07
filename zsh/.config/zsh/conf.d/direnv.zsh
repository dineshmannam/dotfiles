# direnv: per-folder settings from .envrc (approve each one with `direnv allow`).
# The initial export runs at the top of .zshrc, before the p10k instant prompt.
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"
