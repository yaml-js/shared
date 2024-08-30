#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

if [ -L $1 ]; then
  temp="$(readlink "$1")";
  rm -rf "$1";
  cp -rf "$temp" "$1";
fi

echo "Done."
