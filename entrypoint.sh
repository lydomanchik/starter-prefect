#!/usr/bin/env bash

set -e

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ ! -z "$EXTRA_PIP_PACKAGES" ]; then
  echo "+pip install $EXTRA_PIP_PACKAGES"
  pip install $EXTRA_PIP_PACKAGES
fi

if [ -z "$*" ]; then
  echo "\
  ___ ___ ___ ___ ___ ___ _____
 | _ \ _ \ __| __| __/ __|_   _|
 |  _/   / _|| _|| _| (__  | |
 |_| |_|_\___|_| |___\___| |_|

"
  exec bash --login
  echo "before python"
  python flows/example-flow.py
  echo "behind python"
else
  exec "$@"
fi
