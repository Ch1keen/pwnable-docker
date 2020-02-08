# Install ubuntu 16.04
FROM	ubuntu:16.04
LABEL	maintainer="ch1keen@protonmail.com"

# Install essential tools for gdb-peda & pwntools
# dpkg --add-architecture i386 && install *:i386 for 32bit binary execution support
RUN	dpkg --add-architecture i386
RUN	apt -y update
RUN	apt install -y vim python3 python3-dev python3-pip libssl-dev libffi-dev gdb wget curl gcc make git libc6:i386 libncurses5:i386 libstdc++6:i386 ca-certificates patch pkg-config strace ltrace file upx-ucl netcat ruby-full --no-install-recommends

# Install Pwntools
RUN     python3 -m pip install --upgrade pip
RUN     python3 -m pip install --upgrade setuptools
RUN     python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev3

# Install peda-heap
RUN	git clone https://github.com/Mipu94/peda-heap.git ~/peda-heap
RUN	echo "source ~/peda-heap/peda.py" >> ~/.gdbinit

# Radare2
RUN	git clone https://github.com/radare/radare2 ~/radare2
RUN	~/radare2/sys/install.sh

# r2pm and plugins & r2dec plugin install
RUN	r2pm init
RUN	r2pm install r2dec

# Pwntools-ruby
RUN     gem install pwntools

# one-gadget
RUN     gem install one_gadget

VOLUME [ "/home" ]
