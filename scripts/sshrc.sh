#!/usr/bin/env bash
# ssh wrapper that injects a lightweight bashrc into the remote shell
# sshrc/kyrat-style: no install step, nothing left behind on the remote host.
set -euo pipefail

RC_FILE="${SSHRC_RC:-${XDG_CONFIG_HOME:-$HOME/.config}/bash/remote.bashrc}"

if [[ ! -f "$RC_FILE" ]]; then
  echo "sshrc: rc file not found - $RC_FILE" >&2
  exit 1
fi

if [[ $# -eq 0 ]]; then
  echo "usage: sshrc [ssh-options] host" >&2
  exit 1
fi

RC_B64=$(base64 < "$RC_FILE" | tr -d '\n')

exec ssh -t "$@" "
  tmp=\$(mktemp \"\${TMPDIR:-/tmp}/remote.bashrc.XXXXXX\")
  echo $RC_B64 | base64 -d > \"\$tmp\"
  printf '\ntrap '\''rm -f \"%s\"'\'' EXIT\n' \"\$tmp\" >> \"\$tmp\"
  BASH_ENV=\"\$tmp\" exec bash --rcfile \"\$tmp\" -i
"
