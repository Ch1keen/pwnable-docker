# Install ubuntu 16.04
FROM		ubuntu:16.04
MAINTAINER	ch1keen@protonmail.com
RUN		apt -y update && apt -y upgrade

# Install essential tools for gdb-peda & pwntools
RUN	dpkg --add-architecture i386
RUN	apt install -y vim python python-dev git gdb wget curl gcc make radare2

# To install gdb-peda
ADD	https://github.com/longld/peda.git ~/peda
RUN	echo "source ~/peda/peda.py" >> ~/.gdbinit

# To install python-pip
ADD	https://bootstrap.pypa.io/get-pip.py ./get-pip.py
RUN	python get-pip.py
RUN	git clone https://github.com/Gallopsled/pwntools
RUN	pip install --upgrade --editable ./pwntools

# Link!
VOLUME	~/HackIt
