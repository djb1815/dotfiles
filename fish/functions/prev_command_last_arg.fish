function prev_command_last_arg --description 'returns last argument of the previous command'
  echo $history[1] | read --tokenize --local --list tokens
  if test (count $tokens) -gt 1
    string escape -- $tokens[-1]
  end
end
