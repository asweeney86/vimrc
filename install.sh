#!/bin/sh

echo "--[ Cloning repo"
git clone https://github.com/asweeney86/vimrc.git ~/.vim

echo "--[ Linking vimrc"
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim

echo "--[ Setting up vundle"
git submodule init
git submodule update

echo "--[ Installing all bundles"
vim -T dumb -n -es +BundleInstall +qall 

echo "--[ command-t setup"
pushd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make
popd

echo "--[ ymc setup"
pushd ~/.vim/bundle/YouCompleteMe/
sh ./install.sh --clang-completer
popd

echo "--[ Done"
