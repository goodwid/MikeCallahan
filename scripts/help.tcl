# MikeCallahan Online Help
# Usage "/msg Callahan help" or say "Mike, help." for general help.
# For specific help, use "/msg Callahan help <topic>"
#
# Copyright 2006 by Brendan K Callahan <420420@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@unbaptisethedead.info>.




proc pub_help {nick mask hand chan arg} {
	if {[lindex $arg 2] == ""} {
	putserv "PRIVMSG $chan :You can see all my documented features & registering info at http://unbaptisethedead.info/wiki/index.php?title=Category:Help"
	putserv "PRIVMSG $chan :For extensive XTRAS help, please see the info at http://unbaptisethedead.info/wiki/index.php?title=Category:XTRA"
	putserv "PRIVMSG $chan :To generate a password reset request, type '/msg Callahan reset_pass'."
	return
	}
}

proc pub_help_msg {nick host hand arg chan} {
	puthelp "NOTICE $nick :HELP: The following detailed help is available:"
	puthelp "NOTICE $nick :HELP: ident  addhost  tagline  usual  hello   greeting"
	puthelp "NOTICE $nick :HELP: quotes  food  requests  questions  xtra"
	puthelp "NOTICE $nick :HELP: Simply use \"/msg Callahan ehelp <keyword>\" to get detailed help about these functions."
	puthelp "NOTICE $nick :HELP: Detailed info can also be found at http://unbaptisethedead.info/wiki/index.php?title=Category:Help"
	return
}


proc msg_help {nick uhost hand arg} {

##### If "help" is not the first word, bug out. (Fixes the broad approach to catching "help")
	if {[lindex $arg 0] != "ehelp" && [lindex $arg 0] != "ehelp."} {return}

##### If "help" is the only string, list help options
	if {[llength $arg] == 1} {
		puthelp "NOTICE $nick :HELP: The following detailed help is available:"
		puthelp "NOTICE $nick :HELP: ident  addhost  tagline  usual   hello   greeting"
		puthelp "NOTICE $nick :HELP: quotes  food  requests  questions  xtra"
		puthelp "NOTICE $nick :HELP: Simply use \"/msg Callahan ehelp <keyword>\" to get detailed help about these functions."
		puthelp "NOTICE $nick :HELP: Detailed info can be found at http://unbaptisethedead.info/wiki/index.php?title=Category:Help"
		return
	}

##### Begin keyed help
	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "ident"} {
		puthelp "NOTICE $nick :IDENT:"
		puthelp "NOTICE $nick :IDENT: \"/msg Callahan IDENT <password>\""
		puthelp "NOTICE $nick :IDENT: This will only add the current hostmask you are using."
		return
	}
	
	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "hello"} {
		puthelp "NOTICE $nick :HELLO:"
		puthelp "NOTICE $nick :HELLO: \"/msg Callahan my hello is <ON|OFF>\""
		puthelp "NOTICE $nick :HELLO: This will set if you might be greeted upon entry occasionally."
		return
	}
	
	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "greeting"} {
		puthelp "NOTICE $nick :GREETING:"
		puthelp "NOTICE $nick :GREETING: \"/msg Callahan my greeting is <verb phrase>\""
		puthelp "NOTICE $nick :GREETING: This will set your personal greeting that may be used on semi-rare occasions."
		puthelp "NOTICE $nick :GREETING: This should be a verb phrase, and SHOULD NOT HAVE A PERIOD AT THE END"
		puthelp "NOTICE $nick :GREETING: Mike will do something like 'Callahan waves to $nick and <inserts your verb phrase here>.'  Notice he puts the period at the end."
		puthelp "NOTICE $nick :GREETING: If you want 'Callahan waves to $nick and hands him a beer' your verb phrase would be 'hands him a beer'"
		return
	}

	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "addhost"} {
		puthelp "NOTICE $nick :ADDHOST:"
		puthelp "NOTICE $nick :ADDHOST: \"/msg Callahan ADDHOST <password> <hostmask>\""
		puthelp "NOTICE $nick :ADDHOST: Be careful you don't set too liberal a hostmask; if you use this method, you are responsible for errors arising from it."
		puthelp "NOTICE $nick :ADDHOST: If you are uncomfortable with this, use IDENT.   The hostmask specified must not match the hostmask of another user."
		return
	}
	
	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "tagline"} {
		puthelp "NOTICE $nick :TAGLINE:"
		puthelp "NOTICE $nick :TAGLINE: \"/msg Callahan my tagline is <tagline>\""
		puthelp "NOTICE $nick :TAGLINE: Used to set your tagline."
		puthelp "NOTICE $nick :TAGLINE: \"/msg Callahan What is|What's my tagline?\""
		puthelp "NOTICE $nick :TAGLINE: Used to ask me what your tagline is."
		puthelp "NOTICE $nick :TAGLINE: To get this information from myself, there are two commands to use: \"Mike, who am I?\" to retrieve your own and \"Mike, who is <nick>\" to retrieve other's"
		puthelp "NOTICE $nick :TAGLINE: Please do NOT add any punctuation to the end of your tagline."
		puthelp "NOTICE $nick :TAGLINE: In general, your tagline should start with an article such as \"a\", \"an\", or \"the\"."
		return
	}
	
	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "usual"} {
		puthelp "NOTICE $nick :USUAL:"
		puthelp "NOTICE $nick :USUAL: \"/msg Callahan my usual is <tagline>\""
		puthelp "NOTICE $nick :USUAL: This can be used to set your usual \"drink\" (it can be anything, not necessarily a beverage). This is used in many situations, such as when someone is at the line and you enter, as well as Mike randomly picking patron's usuals for various uses to use in channel."
		puthelp "NOTICE $nick :USUAL: \"/msg Callahan What is|What's my usual?\""
		puthelp "NOTICE $nick :USUAL: Used to ask me what your usual is."
		puthelp "NOTICE $nick :USUAL: We do have some advice for syntax in setting this. Mike will usually do something of the nature \"Callahan serves Foo <foo's usual>\", so we suggest using proper English articles, such as \"some\", \"a/an\", or \"the\"."
		puthelp "NOTICE $nick :USUAL: Please do NOT add any punctuation to the end of your usual."
		puthelp "NOTICE $nick :USUAL: If you're Foo, and you set it by typing \"/msg Callahan my usual is a heap of lottery money, with a gold bullion chaser\" it will come out \"Callahan serves Foo a heap of lottery money, with a gold bullion chaser.\""
		puthelp "NOTICE $nick :USUAL: Also note that I added the period; please do not add this yourself, as I use this for other things, and will insert the proper punctuation myself, such as \"Callahan serves Foo a heap of lottery money, with a gold bullion chaser, courtesy of Bar\"."
		puthelp "NOTICE $nick :USUAL: Note this looks a lot odder if it's \"Callahan serves Foo a heap of lottery money, with a gold bullion chaser., courtesy of Bar\""
		puthelp "NOTICE $nick :USUAL: There are several ways to use the usual functions:"
		puthelp "NOTICE $nick :USUAL: \"Mike, usual\" (Give a vague request, get a vague answer)"
		puthelp "NOTICE $nick :USUAL: \"Mike, my usual\" (Can also be followed by anything else such as \"please\" or \"stat\", though I will ignore them.)"
		puthelp "NOTICE $nick :USUAL: \"Mike, give|get me <nicks's> usual\""
		puthelp "NOTICE $nick :USUAL: \"Mike, give|get <nick> my usual\""
		puthelp "NOTICE $nick :USUAL: \"Mike, give|get <nick> <nick's> usual\""
		puthelp "NOTICE $nick :USUAL: \"Mike, give|get <nick> his|their|her usual\""
		puthelp "NOTICE $nick :USUAL: Please be sure to use proper possessives, such as \"foo's\" or \"Bars'\""
		return
	}

	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "quotes"} {
		puthelp "NOTICE $nick :QUOTES:"
		puthelp "NOTICE $nick :QUOTES: I can quote a variety of sources from movies, to TV shows, to fictional and non-fictional characters. Here are the current ones:"
		puthelp "NOTICE $nick :QUOTES: Amore  Kosh  Billy (Madison)  Blazing (Saddles)  Blues (Brothers)  (Get) Shorty  Full (Metal Jacket)  Good(fellas)  Happy (Gilmore)  Pulp (Fiction)"
		puthelp "NOTICE $nick :QUOTES: (Reservoir) Dogs  Scarface  Scream  Ghost (Busters)  Futurama  Family Guy  Dubya  BOFH"
		puthelp "NOTICE $nick :QUOTES: If you wish to provide either more quotes for the above, or something new, please post in his wiki (Requires registration to post)"
		puthelp "NOTICE $nick :QUOTES: http://unbaptisethedead.info/wiki/index.php?title=Category:Help"
		puthelp "NOTICE $nick :QUOTES: Usage: \"Mike, <keyword>\""
		puthelp "NOTICE $nick :QUOTES: \"Mike, quote\" I will spout someone's quote.  May be from as far back as 1999.  For detailed information about quoting patrons, see http://unbaptisethedead.info/mike/quotes.html"
		puthelp "NOTICE $nick :QUOTES: NEW**** Adding an additional string after 'quote' will do a case-sensitive search for only quotes containg the string, such as 'Mike, quote someone'."
		return
	}

	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "food"} {
		puthelp "NOTICE $nick :FOOD:"
		puthelp "NOTICE $nick :FOOD: \"Fly, there's a waiter in my soup!\""
		puthelp "NOTICE $nick :FOOD: breakfast  brunch  lunch  dinner  appetizer  snack  bless  chocolate  booze  tea"
		puthelp "NOTICE $nick :FOOD: \"Mike, <item>\"  I will provide you from a selection of foods or drinks I have in the catagory you specify from above."
		puthelp "NOTICE $nick :FOOD: Usage: Telling me \"Mike, I'll have some\" will get me to serve the last item I've offered to you."
		puthelp "NOTICE $nick :FOOD: If you wish to provide either more items for the above, or something new, please post in his forum (Requires registration to post)"
		puthelp "NOTICE $nick :FOOD: http://unbaptisethedead.info/wiki/index.php?title=Category:Help"
		puthelp "NOTICE $nick :FOOD: \"Mike, bless\" is different in that you will specify either a nick afterwords, or \"me\", and I will serve a God's Blessing as directed."
		return
	}

	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "requests"} {
		puthelp "NOTICE $nick :REQUESTS:"
		puthelp "NOTICE $nick :REQUESTS: \"Mike, tape <nick>\"  I will tape a patron to a random location in the bar. I have many different kinds, and in several glaring color schemes. 133,981 to be exact, if you combine colors, locations, and types of tape.  If you do just colors & types of tape, it's 8,943 combinations of colors & tapes."
		puthelp "NOTICE $nick :REQUESTS: \"Mike, hose <nick>\"  I will hose said person, in various locations on their body.  Usually."
		puthelp "NOTICE $nick :REQUESTS: \"Mike, button\" I will grab a button from my never ending supply, and pin it on you.  Currently 494 in the database."
		puthelp "NOTICE $nick :REQUESTS: \"Mike, fortune\" I will grab a fortune cookie, eat the cookie, and leave you with the fortune.  Currently 4,198 in the database."
		puthelp "NOTICE $nick :REQUESTS: \"Mike, unusual\" I will grab something unusual from under the bar, and give it to you.  Currently 39 in the database (Donations welcome!)"
		puthelp "NOTICE $nick :REQUESTS: \"Mike, soapbox\" I will get you a soapbox to stand on.  There is no functionality for this like there is for a Toast, nor is there any planned functionality, as this is an informal device."
		puthelp "NOTICE $nick :REQUESTS: \"Mike, play\" Mike will start XMMS up and play something randomly. Currently 6,881 tracks in the database."
		puthelp "NOTICE $nick :REQUESTS: \"Mike, news | news about me | news about <nick>\" Basically, I'll creates some 'news' headlines (and sometimes commentary)."
		puthelp "NOTICE $nick :REQUESTS: \"Mike, weather\" I will give you your weather for either the ZIPCODE or LOCATIONID you have set.  Please note that if you set ZIPCODE to other than \"00000\", I will not even check the LOCATIONID.  Try \"/msg Callahan help xtra\" for further information"
		puthelp "NOTICE $nick :REQUESTS: \"Mike, useless\" I will spout some useless information.  May be used in place of \"How about that $sports_team_local?\" during OS wars, gun-talk, knitting discussions and geek-talk."
		puthelp "NOTICE $nick :REQUESTS: If you wish to provide either more items for the above, or something new, please post in his forum (Requires registration to post)"
		puthelp "NOTICE $nick :REQUESTS: http://unbaptisethedead.info/wiki/index.php?title=Category:Help"
		return
	}

	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "questions"} {
		puthelp "NOTICE $nick :QUESTIONS:"
		puthelp "NOTICE $nick :QUESTIONS: \"Inquiring minds want to 'Oh, no!'\""
		puthelp "NOTICE $nick :QUESTIONS: when|how long  who  FAQ|rules  seen <nick>  should|would|will|shall|could|can|may|is"
		return
	}

	if {[lindex $arg 0] == "ehelp" && [lindex $arg 1] == "xtra"} {
		puthelp "NOTICE $nick :XTRA:"
		puthelp "NOTICE $nick :XTRA: SMOKER  Used to track your smoking preferences with me"
		puthelp "NOTICE $nick :XTRA: GENDER  Used to track your public gender with me"
		puthelp "NOTICE $nick :XTRA: ZIPCODE  Used for weather"
		puthelp "NOTICE $nick :XTRA: LOCATIONID  Used for weather"
		puthelp "NOTICE $nick :XTRA: FAMILIAR  Used to store a familiar/diminuative name for yourself, that I can use on occasion."
		puthelp "NOTICE $nick :XTRA: HELLO  Binary switch (OFF|ON) to set whther he *might* personally greet you upon entry"
		puthelp "NOTICE $nick :XTRA: GREETING  This is a VERB phrase that Mike will use on rare occasion if you set HELLO to 'ON'.  Please see 'ehelp greeting' for further clarification"
		puthelp "NOTICE $nick :XTRA: Due to too much information to be included here, please see Mike's web-based documentation at http://unbaptisethedead.info/wiki/index.php?title=Category:Help for further details for, and options with, XTRA http://unbaptisethedead.info/wiki/index.php?title=Category:XTRA functions"
		return
	}
	return
}

putlog "Online Help loaded. . ."

