function vsc --wraps code --description 'opens current directory or specified file in vscode'
    if test (count $argv) -gt 0
        code $argv
    else
        code .
    end
end
