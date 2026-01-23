## Environment Variables & Settings ##

## Antidote Plugin Manager
zstyle ':antidote:bundle' 'use-friendly-names' yes

## Zephyr Framework
zstyle ':zephyr:plugin:*' 'use-cache' yes

## starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

## zsh-eza
# params to always apply
export _EZA_PARAMS=('--group-directories-first' '--time-style=long-iso' '--colour-scale' '--colour-scale-mode=fixed' '--icons=auto')
# enable auto list directories on cd = 1 to enable
export AUTOCD=0

# z (zshz)
export ZSHZ_DATA="${ZDOTDIR:-$HOME}/.z"
export ZSHZ_CASE=smart

## fzf
# substitute ripgrep instead of find for speed
export FZF_DEFAULT_COMMAND="fd --hidden --follow -E 'node_modules/'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d" # directories only

# add previews using bat
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,.DS_Store
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# copy from history with ctrl-y
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,Library,.Trash
  --preview 'eza --tree --icons=auto --group-directories-first --level=2 {}'"

## zbell
# seconds before zbell is enabled
#zbell_duration=30
# ignore list
#zbell_ignore=($EDITOR $PAGER claude code nano vi vim)
