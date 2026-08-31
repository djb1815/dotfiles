# abbreviations which auto-expand common bash history expansion expressions
abbr -a --position anywhere '!!' --function prev_command
abbr -a --position anywhere '!*' --function prev_command_args
abbr -a --position anywhere '!$' --function prev_command_last_arg
