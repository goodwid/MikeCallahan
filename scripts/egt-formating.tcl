#Processes a file for standard .egt format


proc pub_one-off {nick mask hand chan arg} {
	if {$nick == "AuntieEm" || $nick == "Flaim"} {
	#####Change to file location and name
        set file_name "./scripts/booze.txt"
	#####Leave this untouched until next comment
	putlog "$file_name"
        set temp_file [open $file_name "r+"]
        set booze [split [read -nonewline $temp_file] "\n"]
	set booze2 ""
	set counter 0
	set booze_length [llength $booze]
	while {$counter < $booze_length} {
		set temp_string [lindex $booze $counter]
	#####These are the parameters you can change to process it to the standard .egt format
		set temp_string [string replace $temp_string 0 3]
		set temp_string [string replace $temp_string 0 1 "a "]
	#####Keep the rest of this in
		append temp_string "¶"
		puts $temp_file $temp_string
		incr counter
	}
	flush $temp_file
	close $temp_file
	putserv "PRIVMSG $chan :$nick, I'm done fucking up that file you asked me to process."
return
	}
}


