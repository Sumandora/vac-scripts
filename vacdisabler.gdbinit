# Invoke like this
# gdb -p $(pidof steam) --command=vacdisabler.gdbinit

set pagination off
set height 0
set logging enabled off

# Update the find call for your specific session
# $ cat /proc/$(pidof steam)/maps | grep steamservice.so | grep r-xp
find 0x1337, 0x1337, '\x55', '\x89', '\xe5', '\x57', '\x56', '\x53', '\x81', '\xec', '\xec', '\x00'
set *(unsigned char*)($_-10)=0xc3

continue
