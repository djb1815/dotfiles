# set commands to empty so fzf doesn't bind these keys
set -gx FZF_CTRL_T_COMMAND ''

# default opts sets:
# 1) color scheme 2) skipped dirs
set -gx FZF_DEFAULT_OPTS " \
  --color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
  --color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
  --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
  --color=selected-bg:#494D64 \
  --color=border:#6E738D,label:#CAD3F5
  --walker-skip=.git,node_modules,.cache,.Trash,.Trashes,Library"

# file path picker, bound to ctrl-f:
# 1) preview dirs in eza or files in bat 2) bind alt-/ to toggle preview
set -gx FZF_CTRL_T_OPTS "
  --preview 'if test -d {}; \
    eza --tree --color=always --icons=auto --group-directories-first --level=2 {}; \
    else; bat -n --color=always {}; end'
  --bind 'alt-/:change-preview-window(down|hidden|)'"

# cd dir picker w/tree preview
set -gx FZF_ALT_C_OPTS "
  --preview 'eza --tree --color=always --icons=auto --group-directories-first --level=2 {}'"

# history search:
# 1) displays datetime w/binding to hide 2) binds ctrl-y to yank w/hint
set -gx FZF_CTRL_R_OPTS "
  --with-nth 1,3.. --bind 'alt-t:change-with-nth(3..|1,3..)'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

fzf --fish | source

# custom binding for ctrl-t path completion widget
# (must be after functions are sourced from `fzf --fish`)
bind \cf fzf-file-widget
bind -M insert \cf fzf-file-widget
