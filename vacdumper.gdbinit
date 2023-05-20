# Invoke like this
# gdb -p $(pidof steam) --command=vacdumper.gdbinit

set pagination off
set height 0
set logging enabled off

# Update the find call for your specific session
# $ cat /proc/$(pidof steam)/maps | grep steamservice.so | grep r-xp
find 0x1337, 0x1337, '\x80', '\x3A', '\x7F', '\x74', '\x2C'
set $counter = 0

break *$_
command 1
	set $size = *(uint32_t*)($edx+32) + ( *(uint16_t*)($edx+48) + *(uint16_t*)($edx+46) )
	eval "set $filename = \"module_%d-%d.so\"", $counter, $size
	# Size calculation isn't accurate. Just add 0x4000 to it, to ensure that the entire module gets dumped
	eval "dump binary memory %s (void*)$edx (void*)($edx+$size+0x4000)", $filename
	set $counter = $counter + 1
	continue
end

continue
