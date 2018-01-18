#!/bin/bash

rsync -a --progress \
  --exclude='.git*' \
  --exclude='*~' \
  --exclude='sync.sh' \
  . ~ \
  # --dry-run
