abbr --add '~' 'cd ~'
abbr --add '-' 'cd -'
abbr --add '..' 'cd ..'
abbr --add vi nvim

# dirstack navigation
for i in (seq 1 9)
    abbr -a --position anywhere -- ..$i (string repeat -n $i "../" | string sub -e -1)
end

# typos
abbr -a -- cd.. "cd .."
abbr -a -- which type

abbr --add l 'ls --header --long'
abbr --add lm 'ls --header --long --sort=modified'
abbr --add ll 'ls --all --header --long'
abbr --add llm 'ls --all --header --long --sort=modified'
abbr --add lt 'ls --tree'
abbr --add tree 'ls --tree'
abbr --add la 'eza -lbhHigUmuSa'
abbr --add lx 'eza -lbhHigUmuSa@'
