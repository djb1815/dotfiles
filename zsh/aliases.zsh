## Aliases ##

# VS Code
function vsc {
  if (( $# )); then
    code $@
  else
    code .
  fi
}

alias vscd="code --diff"

# eza - ls replacement
alias ls='eza ${(@)_EZA_ALIAS_PARAMS}' # plain listing
alias l='eza --header --long ${(@)_EZA_ALIAS_PARAMS}' # detailed listing
alias lm='eza --header --long --sort=modified ${(@)_EZA_ALIAS_PARAMS}' # detailed listing sorted by modified time
alias ll='eza --all --header --long ${(@)_EZA_ALIAS_PARAMS}' # detailed listing incl. hidden files
alias llm='eza --all --header --long --sort=modified ${(@)_EZA_ALIAS_PARAMS}' # detailed listing incl. hidden, sorted by modified time
alias la='eza -lbhHigUmuSa' # detailed listing, no icons/git/grouping
alias lx='eza -lbhHigUmuSa@' # detailed listing, no icons/git/grouping, with extended attrs
alias lt='eza --tree ${(@)_EZA_ALIAS_PARAMS}' # tree view
alias tree='eza --tree ${(@)_EZA_ALIAS_PARAMS}' # tree view

# cd
alias ~="cd ~"
alias ..="cd .."

# nvim
alias vi="nvim"

# z -> fzf -> cd - Use fzf as an improved fronted for zsh-z
unalias z 2> /dev/null
compdef _zshz z
function z() {
  [ $# -gt 0 ] && zshz "$*" && return
  local dir=$(
    zshz 2>&1 | 
    fzf --height 40% --layout reverse --info inline \
        --nth 2.. --tac --no-sort --query "$*" \
        --accept-nth 2..
  ) && cd "$dir"
}
