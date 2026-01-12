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
alias lm="eza -l --sort modified $eza_params"
alias l="eza -l $eza_params"

# cd
alias ~="cd ~"
alias ..="cd .."

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
