# Lightweight bashrc injected by `sshrc` for remote hosts with limited capability.
# Self-contained on purpose: no assumption of modern tools (eza/fzf/mise) or any
# locally installed plugin - this has to work on bare bash.

[ -z "$PS1" ] && return

# Pull in the remote host's own bashrc to pick up local-only config
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

## Comfort settings ##
shopt -s checkwinsize
shopt -s histappend
shopt -s cdspell 2>/dev/null
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT='%F %T '
shopt -s histverify
# Arrow keys filter history by whatever's already typed, not just linear recall
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export EDITOR=vi
export PAGER=less
export LESS='-g -i -M -R -S -w -z-4'
export LESS_TERMCAP_mb=$'\033[01;34m'
export LESS_TERMCAP_md=$'\033[01;34m'
export LESS_TERMCAP_me=$'\033[00m'
export LESS_TERMCAP_so=$'\033[00;47;30m'
export LESS_TERMCAP_se=$'\033[00m'
export LESS_TERMCAP_us=$'\033[04;35m'
export LESS_TERMCAP_ue=$'\033[00m'

# GNU ls: LS_COLORS + --color=auto. BSD/macOS ls: CLICOLOR + LSCOLORS.
# Force our own base-16 ANSI LS_COLORS: hosts often set one via dircolors
# ignoring the terminal's theme palette. Plain ANSI codes render using
# whatever the terminal defines.
LS_COLORS='di=34:ln=36:ex=32'
LS_COLORS+=':mi=1;31:or=1;31'
LS_COLORS+=":$(printf '*.%s=31:' tar tgz tbz tbz2 tz tzo tzst txz taz t7z zip gz bz2 xz zst lz lz4 lzo lzma lha lrz z rar arc arj ace zoo cpio 7z rz cab wim swm dwm esd deb rpm jar war ear sar alz | sed 's/:$//')"
LS_COLORS+=":$(printf '*.%s=33:' pem key crt cer csr p12 pfx jks keystore truststore der pub | sed 's/:$//')"
LS_COLORS+=':*.bak=2:*~=2'
export LS_COLORS
export CLICOLOR=1
export LSCOLORS='ExGxFxdaCxDaDahbadacec'
if ls --color=auto / >/dev/null 2>&1; then
  alias ls='ls --color=auto'
fi
alias l='ls -lh'
alias lm='ls -lhtr'
alias ll='ls -lah'
alias llm='ls -lahtr'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ~='cd ~'
alias -- -='cd -'
alias h='history | less +G'
alias isodate='date +%Y-%m-%dT%H:%M:%S%z'
alias isodate_utc='date -u +%Y-%m-%dT%H:%M:%SZ'
alias timestamp='date +%s'

# up N - cd up N directory levels, defaults to 1
up() {
  local levels="${1:-1}" path=""
  [[ "$levels" =~ ^[0-9]+$ ]] || { echo "usage: up [levels]" >&2; return 2; }
  for ((i = 0; i < levels; i++)); do path="../$path"; done
  cd "$path" || return
}

## Prompt - Pure-style single line: ssh marker, user, cwd, ❯❯ colored by last exit status ##
_remote_prompt() {
  local reset='\[\033[0m\]' dim='\[\033[2m\]' cyan='\[\033[36m\]' magenta='\[\033[35m\]'
  PROMPT_COMMAND='_remote_prompt_status=$?'
  PS1="${dim}(ssh)${reset} ${magenta}\u${reset} ${cyan}\w${reset} "'\[$([ "$_remote_prompt_status" = 0 ] && echo -en "\033[32m" || echo -en "\033[31m")\]'"❯❯${reset} "
}
_remote_prompt
unset -f _remote_prompt

## Vim comfort settings, no plugins ##
export VIMINIT='set scroll=1 timeoutlen=600 ttimeoutlen=10 ttyfast lazyredraw
  set number relativenumber scrolloff=5
  set ignorecase smartcase
  let mapleader=" "
  syntax on
  silent! colorscheme slate'
