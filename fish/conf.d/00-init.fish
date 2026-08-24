# init: runs before every other conf.d file (the 00- prefix wins the sort),
# so later snippets can rely on XDG, PATH, and homebrew being ready.

init_xdg
init_homebrew
init_env
