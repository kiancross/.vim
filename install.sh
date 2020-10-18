#!/usr/bin/env bash
#
# (C) 2017 Kian Cross
#

vimrc=~/.vimrc

if [ -e $vimrc ]; then
  read -r -p "~/.vimrc already exists. Can it be overwritten? [y/N] " response
  if echo "$response" | grep -iq "[^y]" ;then
    echo "Aborting Install"
    exit
  fi
fi

echo "Creating ~/.vimrc..."
echo "source ~/.vim/vimrc" > $vimrc

echo "Finished!"
