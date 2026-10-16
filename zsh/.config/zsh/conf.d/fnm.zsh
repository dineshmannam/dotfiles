# fnm: per-folder Node version from .nvmrc / .node-version (switches on cd).
# --log-level=quiet keeps its startup message from tripping the p10k instant-prompt warning.
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --log-level=quiet)"

# Outside a Node project, fnm falls back to its `default` alias. On a fresh
# machine that alias does not exist, so every cd asks to install Node.
# Point it at the Homebrew node once; `fnm default <version>` overrides it.
[[ -e "${FNM_DIR:-$HOME/.local/share/fnm}/aliases/default" ]] || fnm default system >/dev/null 2>&1

# After fnm switches versions on cd, drop zsh's cached command paths so `node`
# resolves to the new version instead of the one hashed at startup.
_fnm_rehash() { rehash }
add-zsh-hook chpwd _fnm_rehash
