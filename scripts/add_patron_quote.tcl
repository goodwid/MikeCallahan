#Processes a file for standard .egt format


global last_quote last_quoter 


proc pub_add_quote {nick mask hand arg} {
	upvar #0 last_quote last_quote_local
	upvar #0 last_quoter last_quoter_local

	if [matchattr [nick2hand $nick] +Q] {
		set counter 2
		while {$counter < [llength $arg]} {lappend temp_string [lindex $arg $counter];incr counter}
		putlog "temp_string is $temp_string"

		#Opening the file, writing, and closing it cleanly.
		set file_name "./scripts/patron_quotes.egt"
       		set temp_file [open $file_name "a"]
		puts $temp_file $temp_string
		flush $temp_file
		close $temp_file

		#notifying channel that a quote has been added
		putquick "PRIVMSG #callahans :\001ACTION quietly walks over to a notebook, and scribbles '$temp_string' into it for future reference.\001"
	
		#notifying authorized quote adders online that it has been added. 
		foreach msgee [chanlist #callahans +Q] {
			putserv "PRIVMSG $msgee :'$temp_string' added by $nick"
		}
		set last_quoter_local $nick
		set last_quote_local $temp_string
		return
	}	 
	putserv "PRIVMSG #callahans :\001ACTION notes $nick, someone NOT authorized to add quotes, tried to do so.\001"

	return
}

proc pub_add_food {nick mask hand arg} {

	if [matchattr [nick2hand $nick] +Q] {
		set counter 2
		while {$counter < [llength $arg]} {lappend temp_string [lindex $arg $counter];incr counter}

	if {[lindex $arg 1] == "appetizer"} {set temp_file_name "appetizer"}
	if {[lindex $arg 1] == "breakfast"} {set temp_file_name "breakfast"}
	if {[lindex $arg 1] == "dinner"} {set temp_file_name "dinner"}
	if {[lindex $arg 1] == "dessert"} {set temp_file_name "dessert"}
	if {[lindex $arg 1] == "brunch"} {set temp_file_name "brunch"}
	if {[lindex $arg 1] == "lunch"} {set temp_file_name "lunch"}
	if {[lindex $arg 1] == "snack"} {set temp_file_name "snack"}
	if {[lindex $arg 1] == "tea"} {set temp_file_name "tea"}
	
		set file_name "./scripts/$temp_file_name.egt"
       		set temp_file [open $file_name "a"]
		puts $temp_file $temp_string
		flush $temp_file
		close $temp_file
		

		#notifying channel that food has been added
		putquick "PRIVMSG #callahans :\001ACTION quietly walks over to the $temp_file_name menu, and scribbles '$temp_string' into it for future use.\001"
	
		#notifying authorized food adders online that it has been added. 
		foreach msgee [chanlist #callahans +Q] {
			putserv "PRIVMSG $msgee :'$temp_string' added to the $temp_file_name menu by $nick"
		}
		putserv "PRIVMSG $nick :Please update the appropriate page at  http://unbaptisethedead.info/wiki/index.php?title=Category:Data"
		return
	}	 
	putserv "PRIVMSG #callahans :\001ACTION notes $nick, someone NOT a chef, tried to change the menu.\001"

	return
}

proc pub_add_other {nick mask hand arg} {

	if [matchattr [nick2hand $nick] +Q] {
		set counter 2
		set file_name ""
		while {$counter < [llength $arg]} {lappend temp_string [lindex $arg $counter];incr counter}

		putlog "'$file_name'; $temp_string; $arg"

		if {[lindex $arg 1] == "button"} {set temp_file_name "buttons"}
		if {[lindex $arg 1] == "fortune"} {set temp_file_name "fortune"}
		if {[lindex $arg 1] == "ChaCha"} {set temp_file_name "chacha"}
		if {[lindex $arg 1] == "chacha"} {set temp_file_name "chacha"}
		
		putlog "'$temp_file_name;' $temp_string"
	
		set file_name "./scripts/$temp_file_name.egt"
       		set temp_file [open $file_name "a"]
		puts $temp_file $temp_string
		flush $temp_file
		close $temp_file
		

		#notifying channel that food has been added
		putquick "PRIVMSG #callahans :\001ACTION quietly walks over to the $temp_file_name archive, and scribbles '$temp_string' into it for future use.\001"
	
		#notifying authorized food adders online that it has been added. 
		foreach msgee [chanlist #callahans +Q] {
			putserv "PRIVMSG $msgee :'$temp_string' added to the $temp_file_name archive by $nick"
		}
		#putserv "PRIVMSG $nick :Please update the appropriate page at  http://unbaptisethedead.info/wiki/index.php?title=Category:Data"
		return
	}	 
	putserv "PRIVMSG #callahans :\001ACTION notes $nick, someone NOT in the Writer's Guild, tried to change the story.\001"

	return
}
