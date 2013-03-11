##### News (FOX network style).tcl
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "FOX Mews -- Sacred and imbalanced! VERY imbalanced (v.10)"



proc pub_random_news {nick mask hand chan arg} {
	upvar #0 headline_text headline_text_local news_item_nick_first_text news_item_nick_first_text_local news_item_nick_last_text news_item_nick_last_text_local news_item_two_nicks_text news_item_two_nicks_text_local news_quote_text news_quote_text_local random_patron random_patron_local patron patron_local
	priv_set_news
	set odds [rand 1000]
	set indicator 0
	pick_random_patron $chan
	set patron_1 $random_patron_local
	while {$indicator == 0} {
		pick_random_patron $chan
		set patron_2 $random_patron_local
			if {$patron_1 != $patron_2} {
				set indicator 1
			}
	}
	set indicator 0
	pick_random_patron $chan
	set patron_3 $random_patron_local
	while {$indicator == 0} {
		pick_random_patron $chan
		set patron_3 $random_patron_local
			if {$patron_1 != $patron_3 && $patron_2 != $patron_3} {
				set indicator 1
			}
	}
	if {$odds < 650} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- $patron_1 $news_item_nick_first_text_local."
		if { $odds > 118 && $odds < 247} {puthelp "PRIVMSG $chan :-- $news_quote_text_local $patron_2."}
		return
	}
	if {$odds > 649 && $odds < 901} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- $news_item_nick_last_text_local $patron_1."
		if { $odds > 675 && $odds < 749} {puthelp "PRIVMSG $chan :-- $news_quote_text_local $patron_2."}
		return
	}
	if {$odds > 900} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- $patron_1  and $patron_2 $news_item_two_nicks_text_local."
		if { $odds > 924 && $odds < 966} {puthelp "PRIVMSG $chan :-- $news_quote_text_local $patron_3."}
		return
	}
	return
}

proc pub_random_news_self {nick mask hand chan arg} {
	if {$nick == "Chrisbert"} {return}
	upvar #0 headline_text headline_text_local news_item_nick_first_text news_item_nick_first_text_local news_item_nick_last_text news_item_nick_last_text_local news_item_two_nicks_text news_item_two_nicks_text_local news_quote_text news_quote_text_local random_patron random_patron_local patron patron_local
	priv_set_news
	set odds [rand 1000]
	set indicator 0
	pick_random_patron $chan
	set patron_1 $random_patron_local
	while {$indicator == 0} {
		pick_random_patron $chan
		set patron_2 $random_patron_local
			if {$patron_1 != $patron_2} {
				set indicator 1
			}
	}
	set indicator 0
	pick_random_patron $chan
	set patron_3 $random_patron_local
	while {$indicator == 0} {
		pick_random_patron $chan
		set patron_3 $random_patron_local
			if {$patron_1 != $patron_3 && $patron_2 != $patron_3} {
				set indicator 1
			}
	}
	if {$odds < 650} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- $nick $news_item_nick_first_text_local."
		if { $odds > 118 && $odds < 387} {puthelp "PRIVMSG $chan :-- $news_quote_text_local $patron_2."}
		return
	}
	if {$odds > 649 && $odds < 901} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- $news_item_nick_last_text_local $nick."
		if { $odds > 675 && $odds < 799} {puthelp "PRIVMSG $chan :-- $news_quote_text_local $patron_2."}
		return
	}
	if {$odds > 900} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- $nick and $patron_2 $news_item_two_nicks_text_local."
		if { $odds > 924 && $odds < 966} {puthelp "PRIVMSG $chan :-- $news_quote_text_local $patron_3."}
		return
	}
	return
}

proc pub_random_news_other {nick mask hand chan arg} {
	if {[lindex $arg 3] == "me" || [lindex $arg 3] == "ME" || [lindex $arg 3] == "Me" || [lindex $arg 3] == "mE"} {return}
	if {$nick == "Chrisbert"} {return}
upvar #0 headline_text headline_text_local news_item_nick_first_text news_item_nick_first_text_local news_item_nick_last_text news_item_nick_last_text_local news_item_two_nicks_text news_item_two_nicks_text_local news_quote_text news_quote_text_local random_patron random_patron_local patron patron_local
	priv_set_news
	set odds [rand 1000]
	set indicator 0
	patron_match [lindex $arg 3] $chan [string length [lindex $arg 3]]
	putlog "nick: [lindex $arg 3] $chan length: [llength [lindex $arg 3]] match: $patron_local"
	set patron_1 $patron_local
	while {$indicator == 0} {
		pick_random_patron $chan
		set patron_2 $random_patron_local
			if {$patron_1 != $patron_2} {
				set indicator 1
			}
	}
##### For the smart asses in every channel, on every network.  You know someone will trigger these eventually.
	if {[lindex $arg 3] == "Bush" || [lindex $arg 3] == "Dubya" || [lindex $arg 3] == "dubya"} {set patron_1 "Dubya"}
	if {[lindex $arg 3] == "noone" || [lindex $arg 4] == "nobody"} {return}
	if {[lindex $arg 3] == "Gates" || [lindex $arg 4] == "Gates"} {set patron_1 "Bill Gates"}
	if {[lindex $arg 3] == "Ahnold" || [lindex $arg 3] == "ahnold"} {set patron_1 "Governator"}
	if {[lindex $arg 3] == "you" || [lindex $arg 3] == "Callahan" || [lindex $arg 4] == "Callahan"} {set patron_1 "Mike Callahan"}
	if {[lindex $arg 3] == "anyone" || [lindex $arg 3] == "anybody" || [lindex $arg 3] == "someone" || [lindex $arg 3] == "somebody"} {set patron_1 "$patron_2"}
	if {[lindex $arg 3] == "Cheney" || [lindex $arg 4] == "cheney"} {set patron_1 "Dick Cheney"}
	if {[lindex $arg 3] == "God" || [lindex $arg 3] == "god"} {set patron_1 "\$local_diety"}
	if {[lindex $arg 3] == "Jesus" || [lindex $arg 3] == "jesus"} {set patron_1 "\$local_diety's_son"}
	if {[lindex $arg 3] == "Cthulu" || [lindex $arg 3] == "cthulu"} {set patron_1 "\$bad_ass_local_diety"}
	if {[lindex $arg 3] == "Allah" || [lindex $arg 3] == "allah"} {set patron_1 "<image censored>"}
	if {[lindex $arg 3] == "everyone" || [lindex $arg 3] == "Everyone"} {set patron_1 "Everyone"}
	if {[lindex $arg 3] == "everybody" || [lindex $arg 3] == "Everybody"} {set patron_1 "Everybody"}
	if {[lindex $arg 3] == "Sony" || [lindex $arg 3] == "sony"} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :<process_hidden>"
		return
	}
	if {[lindex $arg 3] == "him" || [lindex $arg 3] == "her" || [lindex $arg 3] == "them" || [lindex $arg 3] == "it"} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putquick "PRIVMSG $chan :\001ACTION stops.\001"
		putserv "PRIVMSG $chan :Could you be more specific, $nick?"
		puthelp "PRIVMSG $chan :\001ACTION shuts the presses down, and lays off 30 workers.\001"
		return
	}
	if {[lindex $arg 3] == "SCO" || [lindex $arg 3] == "sco"} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- 'This code stolen', claims SCO"
		return
	}
	if {[lindex $arg 3] == "Flying" || [lindex $arg 3] == "FSM"} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- 'I've been touched by his noodly appendage!', claims $nick"
		return
	}
	if {[lindex $arg 3] == "Monty" || [lindex $arg 4] == "python"} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- 'SPAM! SPAM! SPAM!', shouts $patron_1"
		return
	}

	if {$patron_1 == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :$nick, I don't see them here.  Try again with someone you can see on the nick list"
		return
	}
	set indicator 0
	pick_random_patron $chan
	set patron_3 $random_patron_local
	while {$indicator == 0} {
		pick_random_patron $chan
		set patron_3 $random_patron_local
			if {$patron_1 != $patron_3 && $patron_2 != $patron_3} {
				set indicator 1
			}
	}
	if {$odds < 450} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- $patron_1 $news_item_nick_first_text_local."
		if { $odds > 118 && $odds < 247} {puthelp "PRIVMSG $chan :-- $news_quote_text_local $patron_2."}
		return
	}
	if {$odds > 449 && $odds < 801} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- $news_item_nick_last_text_local $patron_1."
		if { $odds > 675 && $odds < 749} {puthelp "PRIVMSG $chan :-- $news_quote_text_local $patron_2."}
		return
	}
	if {$odds > 900} {
		putquick "PRIVMSG $chan :$headline_text_local"
		putserv "PRIVMSG $chan :-- $patron_1  and $patron_2 $news_item_two_nicks_text_local."
		if { $odds > 924 && $odds < 966} {puthelp "PRIVMSG $chan :-- $news_quote_text_local $patron_3."}
		return
	}
	return
}

proc priv_set_news {} {
set headline {
"-- \*This Just In!\*"
"-- \*Extra! Extra!\*"
"-- \*Extra! Extra!\* Read all about it in the Callahanian Inquirer!"
"-- \*This Just In!\* Read all about it in the Callahan Gazetteer!"
"-- \*Extra! Extra!\* Read all about it in the Callahanian Post!"
"-- \*Extra! Extra!\* Read all about it in the Callahan Thymes!"
"-- \*This Just In!\* Read all about it in the Callahan Son-Thymes!"
"-- \*Extra! Extra!\* Read all about it in the Callahanian Stress!"
"-- \*Extra! Extra!\* Read all about it in the Callahanian Chronic Cull!"
"-- \*Extra! Extra!\* Read all about it in the Callahan's Web Bog!"
"-- \*This Just In!\* Read all about it in the Callahan's Star-Trumbone!"
"-- \*This Hour's Top Headline\*"
"-- \*This Hour's Top Headline\* Read all about it in the Callahanian Examinatrix!"
"-- \*This Hour's Top Headline\* Read all about it in the Callahanian Stool Pigeon!"
"-- \*This Hour's Top Headline\* Read all about it in the Callahanian Instant Messenger!"
"-- \*This Hour's Top Headline\* Read all about it in the Callahan Weakly!"
"-- \*This Hour's Top Headline\* Read all about it in the Callahan Retort!"
"-- \*This Hour's Top Headline\* Read all about it in the Callahan Telegrammaticon!"
"-- \*News Flash!\*"
"-- \*News Flash!\* Read all about it in the Callahanian Observer!"
"-- \*News Flash!\* Read all about it in the Callahanian Ledgerdomain!"
"-- \*News Flash!\* Read all about it in the Callahanian Press!"
"-- \*News Flash!\* Read all about it in the Callahan Transcriptantiation!"
"-- \*News Flash!\* Read all about it in the Callahan +v!"
"-- \*News Flash!\* Read all about it in the Callahan CRT!"
"-- \*Today's Headline\*"
"-- \*Today's Headline\* Read all about it in the Callahanian Open Source Press!"
"-- \*Today's Headline\* Read all about it in the Callahanian Precorder!"
"-- \*Today's Headline\* Read all about it in the Callahanian Bacon!"
"-- \*News Flash!\* Read all about it in the Callahan Herrod!"
"-- \*News Flash!\* Read all about it in the Callahan Outlook Express!"
"-- \*News Flash!\* Read all about it in the Callahan Final Frontier!"
}

set news_item_nick_first {
"Featured in TV Commercials for the Namib Desert Office of Tourism"
"Reported to be Training for Summer Olympics Hot Tub High-Diving"
"Exposed on Inside Edition as Spawn of Bob Dole!"
"Pregnant With Alien Child!"
"Discovers Kermit the Frog Lounging in Bathtub!"
"Distraught Over Psychologist's Report That IRC Causes Insanity!"
"Renounces All to Become a Subway Conductor"
"Attacked by Neurotic Crocodiles while visiting Disneyworld"
"Plans to Travel Around the World in a Bicycle, Departs from the Rockies Next Week"
"Renounces All to Become Biologist!"
"Pregnant With Stellar Voyager Child"
"Claims Responsibilty for Mysterious Outbreak of Peanut Attacks in the Rockies"
"Abducted by Aliens and taken to The Moon to see Charlie Chaplin"
"Traveling to Disneyworld in Stolen Bicycle"
"threatens to implode after eating Kipper"
"Discovered Wandering in Massachusetts after Mysterious Disappearance Two Years Ago"
"Discovered Wandering in Goa, India after Mysterious Disappearance Two Years Ago"
"Discovered Wandering in Hampshire after Mysterious Disappearance Two Years Ago"
"Discovered Wandering in Texas after Mysterious Disappearance Two Years Ago"
"Discovered Wandering in Zaire after Mysterious Disappearance Two Years Ago"
"Discovered Wandering in Kuwait after Mysterious Disappearance Two Years Ago"
"Wins Oscar for Best Tickler"
"Pregnant With Space Creature Daughter"
"-- Local Piano Player, Pummels and Ejects Self -- Asked Personal Question of Paquerette"
"Reported to be Suffering from Hallucinations after All-Night Punning Marathon"
"Discovers Humpty Dumpty Lounging in Bathtub"
"Causes Long Island Peanut Shortage"
"is Really a Space Being From Mercury Canadian Computer Scientists Declared"
"threatens to corrode after eating Custard Cup"
"Seen in Outer Space"
"Elected Average Jane of the Year of Red Square"
"Admits Addiction to IRC, Checks into Clinic in Africa Seeking Treatment"
"Admits Addiction to IRC, Checks into Clinic in Asia Seeking Treatment"
"Admits Addiction to IRC, Checks into Clinic in Antartica Seeking Treatment"
"Admits Addiction to IRC, Checks into Clinic in Europe Seeking Treatment"
"Admits Addiction to IRC, Checks into Clinic in North America Seeking Treatment"
"Admits Addiction to IRC, Checks into Clinic in South America Seeking Treatment"
"Admits Addiction to IRC, Checks into Clinic in Pacific Rim Seeking Treatment"
"Distraught Over Pediatrician's Report That IRC Causes Tooth Decay"
"Announces Departure from IRC to enter Buddhist Retreat in Australia"
"wins Nobel Prize in Literature for work in Making the World a Good and Happy Place by Being Nice to Everybody You Meet"
"Mutates Into Elephant"
"Discovered Moonlighting as the Falkland Islands Politician"
"Announced as Next Candidate for Archbishop of Alberta"
"Revealed to Be Spearhead of Humaniform Robot Invasion of Earth"
"Climbs Empire State Building to Protest Use of Lobsters in Product Testing"
"Wins the Falkland Islands Body-Piercing Contest"
"Featured in Radio Commercials for Iowa Office of Tourism"
"Awarded Nobel Peace Prize for Literature after Marathon PunFest"
"-- Famed Bartender, Exposed As Master Illusionist: All Drinks Found to be vodka"
"Abducted by Extra-Terrestrials and taken to the Fourth Dimension to see John F. Kennedy"
"sets IRC Endurance Record, Remains Online for Thirteen Days Speaking Only About Yogi Bear"
"Exposed on Inside Edition as Son of Joan Rivers"
"Gives Birth to Ninety-Three Children"
"Recovering After Weeklong Battle with Laundry; Plans to Vacation in Transylvania"
"Distraught Over Doctor's Report That IRC Causes Lycanthropy"
"Embattled in Sexual Harassment Lawsuit Over Use of the Word 'Sandwich'"
"Experiences Disturbing Pear Nightmares -- Ukranian Doctors Unable to Provide Relief"
"Revealed to be Grand High Exalted Poobah of The F.B.I."
"Creates Exquisite Stained Glass Sculptures out of Fragments from the Callahan's Fireplace"
"Returns from Photo Expedition to the Namib Desert, Frightens Patrons with Promises of Flash and Power Point Web Presentations"
"Sees Image of Captain Kirk in a Cloud of Smoke"
"Discovers James Bond Lounging in Bathtub"
"Makes Fortune in Stock Market Investing in Tomato Futures"
"Attacked by Fanatical Pandas while visiting Underwater"
"Fined by the Rockies Fashion Police for Wearing Floral Prints and Plaid at the Same Time"
"Survives For Sixty-Nine Days in the Russian Steppes on Cheese Cubes"
"wins Pulitzer Prize for article on Funny Bodily Noises"
"Unable to Explain Sudden Growth of Extra Bellybutton -- Plans Appearance on Entertainment Tonight"
"Weaves Persian Rug Out of Cat Fur, declares 'It's more authentic!'"
}

set news_item_nick_last {
"International Communist Conspiracy Attempts to Recruit"
"'I Saw Visions of Clouds of Whipped Cream with Fairies Flitting Through Them in My Sleep Last Night!' says"
"Ghandi is the Mother of my Daughter proclaims"
"Nancy Reagan is Really My Mother asserts"
"'I am The Reincarnation of George Washington' claims"
"Charlie Chaplin Abducted by Aliens and taken to The Moon to see"
"Does The Tooth Fairy Exist? asks"
"'I Saw Visions of Newfoundland Joining the US in My Sleep Last Night' asserts"
"Jane Fonda is Really My Mother proclaims"
"John F. Kennedy Abducted by Extra-Terrestrials and taken to the Fourth Dimension to see"
"James Earl Jones is the Father of my Child claims"
"'I Saw Visions of the Victoria's Secret Angels in My Sleep Last Night' declares"
"'I am The Reincarnation of Moses' reveals"
"'The Loch Ness Monster Is For Real! Undeniable Proof!' claimed by"
"Image of Batman in a Slot Machine Seen by"
"'I Saw Visions of Texas Joining the US in My Sleep Last Night' insists"
"Black Hole in Callahan's Bar Discovered by"
"Eminem Undergoes Plastic Surgery and Emerges Looking Like"
"'I Was Raised by Wolves' asserts"
"'Rumors of My Death Have Been Under Exaggerated' declares"
"'Dionne Warwick is Really My Mother' insists"
"Reported to be Training for Summer Olympics Hot Tub High-Diving Team"
"'I left the barn door open!' admits"

}

set news_item_two_nicks {
"discovered to be one and the same"
"discovered to be long lost twins"
"discovered to be long lost triplets, 'We each got half of the third sibling'"
"Embattled in Sexual Harassment Lawsuit Over Use of the Word 'Sandwich'"
"Embattled in Sexual Harassment Lawsuit Over Use of the Word 'Torte'"
"Embattled in Sexual Harassment Lawsuit Over Use of the Word 'Hawt'"
"Embattled in Sexual Harassment Lawsuit Over Use of the Word 'Legume'"
"Embattled in Sexual Harassment Lawsuit Over Use of the Word 'Broccoli'"
"Revealed to Be Premiers in The Flat Earthers"
"Share Nobel Prize in Animal Husbandry for work in Pizza Box Origami"
"Renounce All to Become Mathematicians Together"
"Seen Together in Outer Space. -- It's Love"
"Seen Together in Outer Space. -- It's Platonic"
"Seen Together in Outer Space. -- It's Love. Sorta."
"Renounce All to Become Biologists Together"
"Announced as Next Candidates for Vicar of Dibley"
"Featured in TV Commercials for the Utah Office of Tourism"
"Featured in TV Commercials for the Nova Scotia Office of Tourism"
"Featured in TV Commercials for the Queensland Office of Tourism"
"Featured in TV Commercials for the Florida Office of Tourism"
"Featured in TV Commercials for the Minnesota Office of Tourism"
"Featured in TV Commercials for the Pennsylvania Office of Tourism"
"Featured in TV Commercials for the Oregon Office of Tourism"
"Featured in TV Commercials for the Iowa Office of Tourism"
"See Image of Captain Kirk in a Cloud of Smoke at Grateful Dead Concert"
"See Image of Spock in a Cloud of Smoke at Grateful Dead Concert"
"See Image of Scotty in a Cloud of Smoke at Grateful Dead Concert"
"See Image of Bones McCoy in a Cloud of Smoke at Grateful Dead Concert"
"See Image of Captain Kirk in a Cloud of Smoke at Phish Concert"
"See Image of Spock in a Cloud of Smoke at Phish Concert"
"See Image of Scotty in a Cloud of Smoke at Phish Concert"
"See Image of Bones McCoy in a Cloud of Smoke at Phish Concert"
"See Image of Captain Kirk in a Cloud of Smoke at Weird Al Yankovic Concert"
"See Image of Spock in a Cloud of Smoke at Weird Al Yankovic Concert"
"See Image of Bones McCoy in a Cloud of Smoke at Weird Al Yankovic Concert"
"Tie in the Falkland Islands Body-Piercing Contest"
"-- Famed Bartenders, Exposed As Master Illusionists: All Drinks Found to be gin"
}

set news_quote {
"'That's ridiculous! You're not going to print this, are you?' says"
"'That's ridiculous! You're not going to put this in the quote file, are you?' says"
"Photo Exclusive by"
"May Involve"
"Exclusive Pictures Inside from"
"Details and related story on Back Cover designed by"
"Graphic Photos Inside photoshopped by"
"'I'm not a crook' says"
"'I don't understand it at all' states"
"Wikipedia article by"
"'I saw it foretold in a Microsoft Help File' exclaims"
"'Who would have thought it?' says"
"'It's the kind of thing you expect to hear about someone else' claimed"
"'They were always so quiet' wrote"
"'Why wasn't I informed?' asks"
"'There ought to be a law against that' protested"
"LiveJournal exclusive by"
"'Doesn't the 10th Amendment cover this?' inquires"
"'Doesn't the 14th Amendment cover this?' inquires"
"'Doesn't the 2nd Amendment cover this?' inquires"
"'Doesn't the 5th Amendment cover this?' inquires"
"'Some just have to abuse it & ruin it for the rest of us, ya know?' stated"
"Coming to an illegal torrent near you courtesy of"
"Try our new Smell-O-Vision, brought to you by"
"'I voted against that, so dont' blame me' decried"
"'Where I grew up, we rode people like that out on a rail!' emailed"
"'What can I say?' posed"
"'That's why I vote Green Party' from a Voice Mail message left by"
"'That's why I vote Democrat' from a Voice Mail message left by"
"'That's why I vote Republican' from a Voice Mail message left by"
"'That's why I vote Libertarian' from a Voice Mail message left by"
"'That's why I vote Labour' from a Voice Mail message left by"
}

upvar #0 headline_text headline_text_local news_item_nick_first_text news_item_nick_first_text_local news_item_nick_last_text news_item_nick_last_text_local news_item_two_nicks_text news_item_two_nicks_text_local news_quote_text news_quote_text_local

set headline_text_local "[lindex $headline [rand [llength $headline]]]"
set news_item_nick_first_text_local "[lindex $news_item_nick_first [rand [llength $news_item_nick_first]]]"
set news_item_nick_last_text_local "[lindex $news_item_nick_last [rand [llength $news_item_nick_last]]]"
set news_item_two_nicks_text_local "[lindex $news_item_two_nicks [rand [llength $news_item_two_nicks]]]"
set news_quote_text_local "[lindex $news_quote [rand [llength $news_quote]]]"

return
}
