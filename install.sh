DOWNLOAD_URL=https://github.com/gearnode/vim.d.git
INSTALL_PATH=~dotfiles/vimconfig/

mkdir -p $INSTALL_PATH
git clone $DOWNLOAD_URL $INSTALL_PATH
mv ~/.vim ~/.vim_copy
ln -s $INSTALL_PATH ~/.vim

echo -n "Lauch vim and type :PlugInstall"
echo -n "Do you have any errors? (Y/n)"

response=y
read response
if [ $(response) -eq "y" ]; then
  rm -rf ~/.vim_copy
  echo -n "Your vim is now configurate !"
else
  rm -rf ~/.vim
  mv ~/.vim_copy ~/.vim
  echo -n "Something was wrong your config is rollback"
fi
