function prev_command_args --description 'returns all arguments of the previous command'
  echo $history[1] | read --tokenize --local --list tokens
  string escape -- $tokens[2..] | string join ' '
  return 0 # `string join` returns 1 if only one arg
end
