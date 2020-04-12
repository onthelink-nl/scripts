if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
	export HOME=$(bash <<< "echo ~${SUDO_USER:-}")
	unlink $HOME/.bashrc
	sudo rm -rf /etc/init.d/.bashrc
	cd $HOME
	sudo rm -rf /etc/init.d/.bashrc
	sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/master/EVA/qgis/EVA/Modified/.bashrc
	sudo rm -rf /etc/init.d/.bashrc
	sudo cp -f $HOME/.bashrc /etc/init.d/
	sudo rm -rf .bashrc
	sudo ln -s /etc/init.d/.bashrc $HOME/.bashrc
else
  qgist="/etc/init.d/.bashrc"
if [ -f "$qgist" ]; then
	export HOME=$(bash <<< "echo ~${SUDO_USER:-}")
	unlink $HOME/.bashrc
	cd $HOME
	sudo rm -rf .bashrc
	sudo ln -s /etc/init.d/.bashrc $HOME/.bashrc
fi
fi
