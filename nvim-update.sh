#!/bin/bash

cd `dirname "$0"`

echo `nvim -v`
echo ""

echo "start zsync"
zsync2 https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage.zsync

echo "make executable"
chmod +x nvim.appimage

echo "create nvim link"
echo ""

ln -s nvim.appimage nvim

echo ""
echo `nvim -v`
echo ""

echo 'Update nvim plugins...'

nvim -c 'PlugUpgrade' -c 'UpdateRemotePlugins' -c 'PlugUpdate' -c 'CocUpdate' -c 'qa!'

echo "DONE"
