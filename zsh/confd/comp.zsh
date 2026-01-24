## Completion customisations ##

# Ignore config variables and functions set by plugins
zstyle ':completion:*:parameters' ignored-patterns \
  '(#i)*p9k*' \
  '*POWERLEVEL*' \
  'VCS_STATUS_*' \
  '_*'
