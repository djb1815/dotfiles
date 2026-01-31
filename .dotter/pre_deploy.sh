#!/usr/bin/env zsh

alias brubun_check="brew bundle check --no-upgrade"
alias brubun_install="brew bundle install --no-upgrade"

{{#if dotter.packages.shell}}
brubun_check --file=shell/Brewfile || brubun_install --file=shell/Brewfile
{{/if}}

{{#if dotter.packages.git}}
brubun_check --file=git/Brewfile || brubun_install --file=git/Brewfile
{{/if}}

{{#if dotter.packages.ghostty}}
brubun_check --file=ghostty/Brewfile || brubun_install --file=ghostty/Brewfile
{{/if}}
