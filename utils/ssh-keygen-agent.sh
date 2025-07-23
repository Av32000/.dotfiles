#!/bin/sh

export SSH_AUTH_SOCK="/run/user/$(id -u)/ssh-agent.socket"

while getopts Y:n:f: opt; do
  case $opt in
  f)
    PUBKEY="$OPTARG"
    PRIVKEY="${PUBKEY%.pub}"
    ssh-add -T "$PUBKEY" 2>/dev/null || ssh-add -t 1800 "$PRIVKEY"
    ;;
  esac
done

exec ssh-keygen "$@"
