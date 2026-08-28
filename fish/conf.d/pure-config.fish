## pure-fish prompt config - fisher install pure-fish/pure
set -g pure_check_for_new_release false
set -g fish_transient_prompt 1

# async git details - fisher install acomagu/fish-async-prompt
set -g async_prompt_functions _pure_prompt_git

# config
set -g pure_symbol_prompt '❯❯'
set -g pure_show_numbered_git_indicator true
set -g pure_show_jobs true
set -g pure_shorten_window_title_current_directory_length 3

# colors
set -g pure_color_git_branch 'green'
set -g pure_color_git_dirty 'yellow'
