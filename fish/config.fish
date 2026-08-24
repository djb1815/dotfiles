if status is-interactive
    mise activate fish | source
else if status is-login
    mise activate fish --shims | source
end
