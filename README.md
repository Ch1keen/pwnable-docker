# Pwnable-Docker

Some tools integrated image for easy CTF or education. It could be used for sandboxing.

## How To Run

> $ git clone https://github.com/Ch1keen/pwnable-docker  
> $ docker build -t ch1keen/pwnable ./pwnable-docker  
> $ docker run -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined ch1keen/pwnable  
  
(See what that fucking options mean : https://stackoverflow.com/questions/19215177/how-to-solve-ptrace-operation-not-permitted-when-trying-to-attach-gdb-to-a-pro/32274645)

## Included tools

* Radare2 (https://github.com/radare/radare2)
  * r2pm
  * r2dec (https://github.com/wargio/r2dec-js)
* Pwntools (https://github.com/Gallopsled/pwntools)
* gdb-peda (https://github.com/longld/peda) 
* one_gadget (https://github.com/david942j/one_gadget)
* tracers
  * strace
  * ltrace
* packer
  * upx

## Further works

* Add various tools
* Make user select pwndbg or gdb-peda (or both!)
