#!/bin/bash

DOWNLOAD_URL=https://github.com/gearnode/vim.d.git
INSTALL_PATH=$HOME/vimconfig

mkdir -p $INSTALL_PATH
git clone $DOWNLOAD_URL $INSTALL_PATH
mv $HOME/.vim $HOME/.vim_copy
mv $INSTALL_PATH $HOME/.vim

echo "Lauch vim and type :PlugInstall"
read -p "Do you have any errors? (Y/n):" response
if [ "$response" == "y" ] || [[ -z "${response// }" ]]; then
  rm -rf $HOME/.vim_copy
  echo "Your vim configuration is updated !"
else
  rm -rf $HOME/.vim
  mv $HOME/.vim_copy $HOME/.vim
  echo "Something was wrong..."
  echo "Your configuration is rollback"
fi
