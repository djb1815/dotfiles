# Transient prompt wrapper for Starship

zle-line-init() {
  emulate -L zsh
  [[ $CONTEXT == start ]] || return 0

  while true; do
    zle .recursive-edit
    local -i ret=$?
    [[ $ret == 0 && $KEYS == $'\4' ]] || break
    [[ -o ignore_eof ]] || exit 0
  done

  # Save the full prompt
  local saved_prompt=$PROMPT
  local saved_rprompt=$RPROMPT
  local visible_rprompt transient_rprompt

  # Render transient prompt using minimal Starship config
  PROMPT='$(
    STARSHIP_CONFIG="$HOME/.config/starship/transient.toml" \
      starship prompt --terminal-width="$COLUMNS" \
      --keymap="${KEYMAP:-}" \
      --status="$STARSHIP_CMD_STATUS" \
      --pipestatus="${STARSHIP_PIPE_STATUS[*]}" \
      --cmd-duration="${STARSHIP_DURATION:-}" \
      --jobs="$STARSHIP_JOBS_COUNT"
  )'

  RPROMPT='$(
    STARSHIP_CONFIG="$HOME/.config/starship/transient.toml" \
      starship module time --keymap="${KEYMAP:-}"
  )'
  
  # Set colour here to avoid zsh mis-counting characters
  local grey=%{$(tput setaf 8)%}
  local reset=%{$(tput sgr0)%}
  RPROMPT="${grey}${RPROMPT}${reset} "

  # Update the prompt line
  zle .reset-prompt

  # Restore full prompt for next input
  PROMPT=$saved_prompt
  RPROMPT=$saved_rprompt
  unset ZLE_RPROMPT_INDENT

  if ((ret)); then
    zle .send-break
  else
    zle .accept-line
  fi

  return ret
}

zle -N zle-line-init
