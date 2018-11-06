# Install ubuntu 16.04
FROM		ubuntu:16.04
MAINTAINER	ch1keen@protonmail.com

# Install essential tools for gdb-peda & pwntools
# dpkg --add-architecture i386 && install *:i386 for 32bit binary execution support
RUN	dpkg --add-architecture i386
RUN	apt -y update
RUN	apt install -y vim python python-dev git gdb wget curl gcc make  libc6:i386 libncurses5:i386 libstdc++6:i386 --no-install-recommends

# Install gdb-peda
ADD	https://github.com/longld/peda.git ~/peda
RUN	echo "source ~/peda/peda.py" >> ~/.gdbinit

# Install python-pip
ADD	https://bootstrap.pypa.io/get-pip.py ./get-pip.py
RUN	python get-pip.py
RUN	git clone https://github.com/Gallopsled/pwntools
RUN	pip install --upgrade --editable ./pwntools

# Radare2
ADD	https://github.com/radare/radare2
RUN	sys/install.sh
