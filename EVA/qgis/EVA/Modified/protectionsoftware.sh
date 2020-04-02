#!/bin/bash

export HOME=$(bash <<< "echo ~${SUDO_USER:-}")
cd $HOME
sudo chmod 777 $HOME/.bashrc
sudo rm -rf .bashrc
sudo ln -s /etc/init.d/.bashrc $HOME/.bashrc
sudo chmod 444 $HOME/.bashrc
