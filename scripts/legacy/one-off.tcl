bind pubm - *Mike,~go~for~it* pub_one-off

proc pub_one-off {nick mask hand chan arg} {
        set file_name "/home/callahan/eggdrop/scripts/booze2.txt"
	putlog "$file_name"
        set temp_file [open $file_name "r"]
        set booze [split [read -nonewline $temp_file] "\n"]
        close $temp_file
	set counter 0
	set booze_length [llength  $booze]
	while {$counter < $booze_length} {
		set [lindex $booze $counter] [string replace [lindex $booze $counter] 0 5]
		set [lindex $booze $counter] [string replace [lindex $booze $counter] 0 1 "an"]
		append [lindex $booze $counter] "@@"
		incr counter
	}
	set temp_file [open $file_name "a"]
	set counter 0
	while {$counter < $booze_length} {
		puts $temp_file [lindex $booze $counter]
		incr counter
	}
	close $tempfile
	putserv "PRIVMSG $chan :$nick, I'm done processing that file you asked me to do."
return

}

