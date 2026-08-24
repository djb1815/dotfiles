function tt --description 'convert timestamp to date, or date to timestamp'
    if test -z "$argv[1]"
        date +%s
    else if string match -q '*-*' -- "$argv[1]"
        if string match -q '* *' -- "$argv[1]"
            date -j -f "%Y-%m-%d %H:%M:%S" "$argv[1]" +%s 2>/dev/null
        else
            date -j -f "%Y-%m-%d %H:%M:%S" "$argv[1] 00:00:00" +%s 2>/dev/null
        end
    else
        date -r $argv[1] "+%Y-%m-%d %H:%M:%S"
    end
end
