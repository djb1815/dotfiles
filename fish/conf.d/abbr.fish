abbr --add '~' 'cd ~'
abbr --add '-' 'cd -'
abbr --add '..' 'cd ..'

# dirstack navigation
for i in (seq 1 9)
    abbr -a --position anywhere -- ..$i (string repeat -n $i "../" | string sub -e -1)
end

# typos
abbr -a -- cd.. "cd .."
abbr -a -- cd- "cd -"
abbr -a lt 'tree'
