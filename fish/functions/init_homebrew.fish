function init_homebrew --description 'Load homebrew shellenv'
    set -q HOMEBREW_NO_ASK; or set -gx HOMEBREW_NO_ASK 1
    /opt/homebrew/bin/brew shellenv fish | source
end
