#!/bin/sh

echo "--[ Cloning repo"
git clone git://github.com/asweeney86/vimrc ~/.vim
cd ~/.vim

echo "--[ Setting up vundle"
git submodule init
git submodule update

echo "--[ Installing all bundles"
vim +BundleInstall +qall

echo "--[ command-t setup"
pushd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make
popd

echo "--[ ymc setup"
pushd ~/.vim/bundle/YouCompleteMe/
sh ./install.sh
popd

echo "--[ Done"
