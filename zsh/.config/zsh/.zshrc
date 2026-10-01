# Enable Powerlevel10k instant prompt. Should stay close to the top of this file.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Autosuggestion style — dim grey ghost text
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585b70"

# Powerlevel10k prompt
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh.
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"

# Everything else: one file per topic in conf.d/, loaded in name order.
for conf_file in "$ZDOTDIR"/conf.d/*.zsh(N); do
  source "$conf_file"
done
unset conf_file

# Prefer the self-updating native Claude Code build over the Homebrew cask.
# Must come after `brew shellenv` above, which re-prepends /opt/homebrew/bin.
# typeset -U keeps the first occurrence, so this both re-asserts and de-dupes.
typeset -U path
path=("$HOME/.local/bin" $path)
export PATH

# Machine-specific settings that stay out of git (work aliases, etc.).
[[ -f "$ZDOTDIR/local.zsh" ]] && source "$ZDOTDIR/local.zsh"
