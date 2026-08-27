function zrf --description 'run command in a floating zellij pane'
  command zellij run --name "$argv" --floating -- fish -c "$argv"
end
