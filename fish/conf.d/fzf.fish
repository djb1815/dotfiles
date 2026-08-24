set -gx FZF_DEFAULT_COMMAND "fd --hidden --follow -E 'node_modules/'"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND --type d"

set -gx FZF_CTRL_T_OPTS "
  --walker-skip .git,node_modules,.DS_Store
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

set -gx FZF_CTRL_R_OPTS "
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

set -gx FZF_ALT_C_OPTS "
  --walker-skip .git,node_modules,Library,.Trash
  --preview 'eza --tree --icons=auto --group-directories-first --level=2 {}'"

set -gx FZF_DEFAULT_OPTS " \
  --color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
  --color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
  --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
  --color=selected-bg:#494D64 \
  --color=border:#6E738D,label:#CAD3F5"

fzf --fish | source
