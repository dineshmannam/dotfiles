# Only alias to eza when it is installed, so a missing tool never breaks `ls`.
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons=always --group-directories-first'
  alias la='eza --all --icons=always --group-directories-first'
  alias ll='eza --long --all --git --icons=always --group-directories-first'
  alias tree='eza --tree --icons'
fi

alias n='nvim'
