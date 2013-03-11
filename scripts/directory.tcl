#Directory access checker


putlog "What's the 411?  Directory loaded."

proc pub_directory {nick mask hand chan arg} {
	if [matchattr [nick2hand $nick] +l] {
		putlog "$nick matched for directory"
		putserv "NOTICE $nick :DIRECTORY ACCESS: http://3whack.org/mike/5551212.html Spider:Robinson"
		return
			}	 
	putserv "PRIVMSG $chan :\001ACTION notes $nick, someone NOT recognized by me as a registered user, tried to gain access to the Directory Page.\001"

	return
}