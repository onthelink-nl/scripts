#!/bin/bash

export HOME=$(bash <<< "echo ~${SUDO_USER:-}")
cd $HOME
sudo rm -rf .bashrc
sudo ln -s /etc/init.d/.bashrc $HOME/.bashrc