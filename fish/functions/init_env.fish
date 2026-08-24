function init_env --description 'Set up common environment variable defaults'
    fish_add_path --global --move "$HOME/.local/bin"

    set -q EDITOR; or set -gx EDITOR nvim
    set -q VISUAL; or set -gx VISUAL vscw
    set -q MANPAGER; or set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -q LESS; or set -gx LESS '-g -i -M -R -S -w -z-4'

    # Colorize less (bare `less <file>` usage; man/git already colorize via bat/delta).
    set -q LESS_TERMCAP_mb; or set -gx LESS_TERMCAP_mb (set_color -o blue)
    set -q LESS_TERMCAP_md; or set -gx LESS_TERMCAP_md (set_color -o cyan)
    set -q LESS_TERMCAP_me; or set -gx LESS_TERMCAP_me (set_color normal)
    set -q LESS_TERMCAP_so; or set -gx LESS_TERMCAP_so (set_color -b white black)
    set -q LESS_TERMCAP_se; or set -gx LESS_TERMCAP_se (set_color normal)
    set -q LESS_TERMCAP_us; or set -gx LESS_TERMCAP_us (set_color -u magenta)
    set -q LESS_TERMCAP_ue; or set -gx LESS_TERMCAP_ue (set_color normal)

    # LS_COLORS for bare `ls`/tools that read it directly (eza uses EZA_COLORS instead).
    set -q LS_COLORS; or set -gx LS_COLORS "di=34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43"
end
