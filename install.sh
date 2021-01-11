#!/usr/bin/env bash
#
# (C) 2017 Kian Cross
#

vimrc=~/.vimrc
nvim_dir=~/.config/nvim
nvim_config=$nvim_dir/init.vim

for path in $vimrc $nvim_config; do
  if [ -e $path ]; then
    read -r -p "$path already exists. Can it be overwritten? [y/N] " response
    if echo "$response" | grep -iq "[^y]" ;then
      echo "Aborting Install"
      exit
    fi
  fi
done

echo "Creating $vimrc..."
echo "source ~/.vim/vimrc" > $vimrc

echo "Creating $nvim_config..."
mkdir -p $nvim_dir

cat <<EOT > $nvim_config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOT

echo "Finished!"
