#!/bin/bash

echo 'Update nvim plugins...'

nvim -c 'PlugUpgrade' -c 'UpdateRemotePlugins' -c 'PlugUpdate' -c 'CocUpdate' -c 'qa!'

echo "DONE"
