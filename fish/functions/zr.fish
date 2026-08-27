function zr --description 'run command in a split zellij pane'
  command zellij run --name "$argv" -- fish -c "$argv"
end
