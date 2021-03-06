#!/bin/bash -

#First, install all the prerequisite libraries, including Git. For a Debian-like Linux distribution like Ubuntu, that would be the following
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
	     libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
	     libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
	     python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
#Remove vim if you have it already
sudo apt-get remove vim vim-runtime gvim
sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox
#Once everything is installed, getting the source is easy
git clone https://github.com/vim/vim.git
cd ~
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80
#If you want to be able to easily uninstall vim use checkinstall
sudo apt-get install checkinstall
cd ~/vim
sudo checkinstall
#Set vim as your default editor with update-alternatives
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
