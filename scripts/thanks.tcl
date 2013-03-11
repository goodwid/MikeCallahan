#
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
#
# multilingual thanks in the form of "Thanks Mike" or "Thanks, Mike" to 
# which he'll reply "You're welcome, $nick" in the appropriate language.
#
# 06/05/2006



proc pub_thanks_Japanese   {nick mask hand chan arg} {
	upvar #0 xtra_status xtra_status_local
	get_xtra $nick FAMILIAR $chan
	if {$xtra_status_local != "-1"} {set familiar $xtra_status_local;putlog "FAMILIAR == $xtra_status_local"}
	if {$xtra_status_local == "-1"} {set familiar "";putlog "FAMILIAR == ***BLANK***"}
	get_xtra $nick GENDER $chan
	putlog "xtra_status_local == $xtra_status_local"
	if {$xtra_status_local == "M" && $familiar == ""} {putserv "PRIVMSG $chan :Doitashimashite, $nick-kun."; return}
	if {$xtra_status_local == "M" && $familiar != ""} {putserv "PRIVMSG $chan :Doitashimashite, $familiar-kun."; return}
	if {$xtra_status_local == "F" && $familiar == ""} {putserv "PRIVMSG $chan :Doitashimashite, $nick-chan.";return}
	if {$xtra_status_local == "F" && $familiar != ""} {putserv "PRIVMSG $chan :Doitashimashite, $familiar-chan."; return}
	putserv "PRIVMSG $chan :Doitashimashite, $nick-san."
	return
}

proc pub_thanks_English  {nick mask hand chan arg} { 
	set thanks {
	"You're welcome"
	"No problem"
	"No worries"
	"My pleasure"
	}
	
	putserv "PRIVMSG $chan :[lindex $thanks [rand [llength $thanks]]], $nick."
 }

proc pub_thanks_Arabic {nick mask hand chan arg} { putserv "PRIVMSG $chan :Ala El Rahib Wa El Saa, $nick." }
proc pub_thanks_Portuguese {nick mask hand chan arg} { putserv "PRIVMSG $chan :De nada, $nick." }
proc pub_thanks_Bahasa_M {nick mask hand chan arg} { putserv "PRIVMSG $chan :Sama-sama, $nick." } 
proc pub_thanks_Bahasa_I  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Terima kasih kembali, $nick." }
proc pub_thanks_Bahasa  {nick mask hand chan arg} { putserv "PRIVMSG $chan :$bahasa, $nick." } 
proc pub_thanks_Czech  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Prosím, $nick." }
proc pub_thanks_Icelandic  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Þú ert velkommin, $nick." }
proc pub_thanks_Danish  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Velbekomme, $nick." }
proc pub_thanks_Esperanto  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Nedankinde, $nick." }
proc pub_thanks_Estonian  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Palun, $nick." }
proc pub_thanks_Finnish  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Eipä kestä, $nick." } 
proc pub_thanks_French  {nick mask hand chan arg} { putserv "PRIVMSG $chan :De rien, $nick." }
proc pub_thanks_Frisian   {nick mask hand chan arg} { putserv "PRIVMSG $chan :Is wol klear, $nick." }
proc pub_thanks_Gælic  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Tá failte romhat, $nick." } 
proc pub_thanks_German  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Bitte schön, $nick." }
proc pub_thanks_Hawaiian  {nick mask hand chan arg} { putserv "PRIVMSG $chan :He mea iki, $nick." }
proc pub_thanks_Hebrew  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Be'vakasha, $nick." }
proc pub_thanks_Hungarian  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Szívesen, $nick." }
proc pub_thanks_Italian  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Prego, $nick." }
proc pub_thanks_Korean  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Chonmane Malsumimnida, $nick." } 
proc pub_thanks_Korean2  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Chon-man-e Mal-sum-im-ni-da, $nick." }
proc pub_thanks_Carib_Creole   {nick mask hand chan arg} { putserv "PRIVMSG $chan :D-anyen, $nick." }
proc pub_thanks_Polish  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Nie, ma za co, prosze, $nick." } 
proc pub_thanks_Portugese   {nick mask hand chan arg} { putserv "PRIVMSG $chan :De nada, $nick." }
proc pub_thanks_Russian   {nick mask hand chan arg} { putserv "PRIVMSG $chan :Plazhowst, $nick." } 
proc pub_thanks_Spanish  {nick mask hand chan arg} { putserv "PRIVMSG $chan :De nada, $nick." }
proc pub_thanks_Swedish   {nick mask hand chan arg} { putserv "PRIVMSG $chan :Varsågod, $nick." }
proc pub_thanks_Tagalog  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Walang anuman, $nick." } 
proc pub_thanks_Welsh  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Croeso, $nick." }
proc pub_thanks_Yiddish   {nick mask hand chan arg} { putserv "PRIVMSG $chan :Nishto far vos, $nick." }
proc pub_thanks_Yugoslav  {nick mask hand chan arg} { putserv "PRIVMSG $chan :Ljieto, $nick." }
