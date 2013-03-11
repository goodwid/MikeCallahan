# Family Guy 1.0
#
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
bind pubm - *Mike,~family~guy pub_fg

proc pub_fg {nick mask hand channel args} {
   global peter
   puthelp "PRIVMSG $channel :[lindex $peter [rand [llength $peter]]]"
   }

set peter {

"\"Stewie Griffin: Damn you vile woman, you've impeded my work since the day I escaped your vile womb. \""
"\"Peter Griffin: Look Lois, the two symbols of the Republican Party: an elephant, and a fat white guy who is threatened by change.  \""
"\"Brian Griffin: Whose leg do I have to hump to get a dry martini around here? \""
"\"Peter Griffin: Oh, you people can kiss the fattest part of my ass.  \""
"\"Peter Griffin: Brian, there's a message in my Alpha Bits. It says 'OOOOOO'.  Brian Griffin: Peter, those are Cheerios.  \""
"\"Stewie Griffin: Do these huggies make my ass look big?  \""
"\"Stewie Griffin: Oh I feel so delightfully white trash. Mommy, I want a mullet. \""
"\"Stewie Griffin: Oh, I must give you my e-mail address. It's loismustdie@yahoo.com.\""
"\"Stewie Griffin: Well, I'd love to stay and chat, but you're a bitch.  \""
"\"Peter Griffin: At least they don't put their feminine ointments next to the mustard, Lois. That was the worst hot dog I ever ate. \""
"\"Peter Griffin: YEAH. I'm also addicted to boobies. \""
"\"Chris Griffin: Dad, can you help me with my math homework? Peter Griffin: Math. Math my dear boy is nothing more than the lesbian sister of biology. \""
"\"Stewie Griffin: It appears my wee-wee's been stricken with rigor mortis.  \""
"\"Brian Griffin: Excuse me, would you like to taste my smoked meat log? \""

}

putlog "He's the Family Guy. . ."
