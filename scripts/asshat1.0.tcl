# asshat 1.0
#
# Quotes from our favorite asshat. 
#
# Problems, questions, accolades, hate mail, etc. should go to <maryfinn@12thmonth.com>.
#
bind pubm - !asshat pub_asshat
bind pubm - *Mary,~asshat* pub_asshat
bind pubm - *Signe~is* pub_asshat
bind pubm - *~asshat* pub_asshat


proc pub_asshat {nick mask hand channel args} {
   global asshat
   puthelp "PRIVMSG $channel :[lindex $asshat [rand [llength $asshat]]]"
   }

set asshat {

"\"<AllenS> ~o/'Signe, Signe, everywhere a Signe'/~o\""
"\"<Signe> nilptr: I dunno.  I do it to annoy people \""
"\"<Signe>  OK, I need some help . . . \""
"\"<Signe> Thanks, everyone.  You're almost all completely useless \""
"\"<Signe> excellent.  BEA just fucked us up the ass again. \""
"\"<guppie_> Signe: umm, given all the time I've heard you complain about the users you have to deal with, perhaps tech support isn't your ideal vocation.\""
"\"<Signe> Today's Spam of the Day \""
"\"Signe is cranky. \""
"\"13:28 <Signe> except for the fact that stupid drivers are exacerbated in SUVs  13:30 Signe shrugs.  He and Marcy have a SUV\""
"\"<Signe> it's tiny.  About the size of a dinner roll \""
"\" Signe doesn't know anything\""
"\"<Signe> Oberon: I think you can generalize that even further and just say that 'higher intelligence' subverts Darwinian natural selection.\""

}

putlog "asshat hell. . ."
