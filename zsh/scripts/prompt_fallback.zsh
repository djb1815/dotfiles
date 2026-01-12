#!/usr/bin/env zsh
# ================================================
# Terminal.app fallback prompt
# Two-line, P10k-style left-truncated paths + Git
# Works without vcs_info
# ================================================

# -------------------------
# Git helpers
# -------------------------
function git_branch() {
  # returns "  branchname" or empty if not in git repo
  local branch=""
  if command git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    echo "  $branch"
  fi
}

function git_dirty() {
  # returns " ✚" if there are changes
  if command git rev-parse --is-inside-work-tree &>/dev/null; then
    git diff --quiet 2>/dev/null || echo " ✚"
  fi
}

# -------------------------
# Left-truncated path function
# -------------------------
function p10k_path() {
  local full_path="$PWD"
  local base=""
  local rel=""
  local path_display=""

  # Determine root for relative path
  if git rev-parse --show-toplevel &>/dev/null; then
    base=$(git rev-parse --show-toplevel)
    rel=${PWD/#$base/}
    [[ -z "$rel" ]] && rel="/"  # at root
    path_display=$(basename "$base")  # start with repo root
  else
    # fallback to home
    if [[ "$PWD" == "$HOME"* ]]; then
      base="$HOME"
      rel=${PWD/#$HOME/}
      path_display="~"
    else
      base=""
      rel="$PWD"
      path_display=""
    fi
  fi

  # Split relative path into components
  local parts
  IFS='/' read -r -A parts <<< "$rel"   # properly make array

  local truncated_parts=()
  local num_parts=${#parts[@]}

  # Always show last 2 parts fully, truncate intermediate dirs to 2 letters
  local cutoff=2
  local show_last=2

  for (( i=1; i <= num_parts; i++ )); do
    local part="${parts[i]}"
    [[ -z "$part" ]] && continue
    if (( i <= num_parts - show_last )); then
      truncated_parts+=("${part[1,cutoff]}")
    else
      truncated_parts+=("$part")
    fi
  done

  # Join truncated parts with /
  if (( ${#truncated_parts[@]} > 0 )); then
    path_display+="/$(IFS=/; echo "${truncated_parts[*]}")"
  fi

  echo "$path_display"
}

# -------------------------
# Set prompt
# -------------------------
setopt PROMPT_SUBST

PS1='%F{blue}$(p10k_path)%f%F{magenta}$(git_branch)%f%F{yellow}$(git_dirty)%f
%(?.%F{green}.%F{red})❯%f '

