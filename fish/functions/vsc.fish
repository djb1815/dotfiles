function vsc
    if test (count $argv) -gt 0
        code $argv
    else
        code .
    end
end
