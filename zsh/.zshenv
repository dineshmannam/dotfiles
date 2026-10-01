# zsh always reads this file first, from $HOME.
# It points zsh at ~/.config/zsh for everything else (.zprofile, .zshrc).
# If that folder is ever missing, zsh falls back to its normal $HOME files.
if [[ -d "${XDG_CONFIG_HOME:-$HOME/.config}/zsh" ]]; then
  export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
fi

# Rust toolchain (cargo, rustc)
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
