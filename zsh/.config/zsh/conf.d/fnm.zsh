# fnm: per-folder Node version from .nvmrc / .node-version (switches on cd).
# --log-level=quiet keeps its startup message from tripping the p10k instant-prompt warning.
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --log-level=quiet)"

# After fnm switches versions on cd, drop zsh's cached command paths so `node`
# resolves to the new version instead of the one hashed at startup.
_fnm_rehash() { rehash }
add-zsh-hook chpwd _fnm_rehash
