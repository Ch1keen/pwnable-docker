# Install ubuntu 16.04
FROM		ubuntu:16.04
LABEL	    maintainer="ch1keen@protonmail.com"

# Install essential tools for gdb-peda & pwntools
# dpkg --add-architecture i386 && install *:i386 for 32bit binary execution support
RUN	dpkg --add-architecture i386
RUN	apt -y update
RUN	apt install -y vim python python-dev gdb wget curl gcc make git libc6:i386 libncurses5:i386 libstdc++6:i386 ca-certificates patch pkg-config strace ltrace file upx-ucl netcat --no-install-recommends

# Install gdb-peda
RUN	git clone https://github.com/longld/peda.git ~/peda
RUN	echo "source ~/peda/peda.py" >> ~/.gdbinit

# Install python-pip
ADD	https://bootstrap.pypa.io/get-pip.py ./get-pip.py
RUN	python get-pip.py
RUN	git clone https://github.com/Gallopsled/pwntools ~/pwntools
RUN	pip install --upgrade --editable ~/pwntools

# Radare2
RUN	git clone https://github.com/radare/radare2 ~/radare2
RUN	~/radare2/sys/install.sh

# r2pm and plugins & r2dec plugin install
RUN	r2pm init
RUN	r2pm install r2dec
