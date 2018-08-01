#!/bin/bash

arg="$1"
progname=`basename "$0"`
progdir=`dirname "$0"`

usage="  Usage:
     $progname -h|--help
  or $progname -d|--dry-run
  or $progname -r|--run"

options="-a --progress"

case "$arg" in
  -d|--dry-run|--dryrun) options="$options --dry-run" ;;
  -r|--run) ;;
  -h|--help|*) echo "$usage"; exit 0 ;;
esac

set -x
rsync $options \
  --exclude='.git*' \
  --exclude='*~' \
  --exclude='sync.sh' \
  "$progdir/" "$HOME/"
