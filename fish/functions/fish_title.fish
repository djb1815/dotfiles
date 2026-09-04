function fish_title \
  --description 'set title to current folder and last command' \
  --argument-names last_command

  set --local current_folder (fish_prompt_pwd_dir_length=$pure_shorten_window_title_current_directory_length prompt_pwd)
  if test -z "$last_command"
    echo "$current_folder"
  else
    echo "$current_folder: $last_command"
  end
end
