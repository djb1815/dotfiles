function vscd --wraps code --description 'open diff in vscode'
    code --diff $argv
end
