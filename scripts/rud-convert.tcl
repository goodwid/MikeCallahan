#####################
#  rud-convert.tcl  #
#####################
#
##########
#  Info  #
##########
#
# webpage: http://www.distorted.se/tcl/
#
# conversion tool, relies on google to do the conversion, so anything you might write 
# for google to convert should work here too... do note that this voids googles licence
# agreement....
#
#############
#  Licence  #
#############
#
# Feel free to do whatever with this script as long as I'm credited as original author
#
###############
#  Changelog  #
###############
#
# 2009-04-18 - 2.0
#   Rewrote the whole thing, guess I didn't lack the time after all ;)
#
# 2009-04-18 - 1.0.3
#   Google changed text again, will think of a way to make a permanent fix for it, just lacking time atm
#
# 2009-04-06 - 1.0.2
#   Fixed some character conversion for weird calcs
#
# 2009-03-22 - 1.0.1
#   Fixed for another google change, wider matching now
#
# 2009-02-28 - 1.0b
#   Fixed it as google changed source
#
# 2008-07-01 - 1.0a
#   Fixed it as google changed source
#
# 2007-10-13 - 1.0
#   Initial release
#
#####################
#  Config Settings  #
#####################


# Don't touch the following two lines
catch {::rud::convert::deinit}
namespace eval ::rud::convert {
	# What bind do you want ?
	variable triggers [list !c !convert]

	# What flags to you want to bind on ?
	variable flags "-|-"

	# What useragent do you want to pretend to be ?
	variable useragent "Mozilla/5.001 (windows; U; NT4.0; en-us) Gecko/25250101"
	
###############################
#  No edit below here needed  #
###############################
	variable version 2.0
	variable match
	
    bind evnt -|- prerehash [namespace current]::deinit
	foreach trigger $triggers {
		bind pub $flags $trigger [namespace current]::pub_convert
	}
}

proc ::rud::convert::init { args } {
	variable useragent 
	variable version
	
	package require http
	::http::config -useragent $useragent
	findre
    log "Version $version loaded succesfully, see http://tcl.distorted.se/ for information and updates."
}

proc ::rud::convert::deinit { args } {
    variable triggers
	variable flags
	
	catch {unbind evnt -|- prerehash [namespace current]::deinit}
	foreach trigger $triggers {
		catch {unbind pub $flags $trigger [namespace current]::pub_convert}
    }
	namespace delete [namespace current]
}

proc rud::convert::log { text } {
	putlog "rud-convert -> $text"
}

proc rud::convert::findre { args } {
	variable match
	set result 0
	
	set meters [expr {int(rand()*50+2)}]
	set searchstring [::http::formatQuery "q" "$meters meters to centimeters"]
	set expected "$meters meters = ${meters}00 centimeters"

	set url "http://www.google.com/search?$searchstring"
	set token [::http::geturl $url]

	upvar #0 $token state
	if { [set first [string first $expected $state(body)]] >= 0 } {
		set match(first) [string range $state(body) [expr {$first-30}] [expr {$first-1}]]
		set match(last) [string range $state(body) [expr {$first+[string length $expected]}] [expr {$first+[string length $expected]+30}]]
		set result 1
	} else {
		set match(first) [set match(last) unknown]
	}
	::http::cleanup $token
	#log "Pattern matching set to: $match(first)...$match(last)"
	return $result
}

proc ::rud::convert::pub_convert { nick uhost hand chan text args } {
	variable match
	variable triggers

	if { [string trim $text] == "" } {
		putserv "PRIVMSG $chan :Example usage: [lindex $triggers 0] 100 feet to meters"
		return 0
	}

	set searchstring [http::formatQuery q $text]
	set url "http://www.google.com/search?$searchstring"
	set token [::http::geturl $url]

	upvar #0 $token state
	if { [set first [string first $match(first) $state(body)]] >= 0 && [set last [string first $match(last) $state(body)]] } {
			set result [string range $state(body) [expr {$first + [string length $match(first)]}] [expr {$last - 1}]]
			set result [string map [list "&#215;" "*" "<sup>" "^"] $result]
			putserv "PRIVMSG $chan :[regsub -all {(\d)\s+(\d)} [regsub -all {<[a-zA-Z\/][^>]*>} [string map [list "&nbsp;" ""] $result] ""] {\1\2}]"
	} elseif { [llength $args] == 0 } {
		log "Was unable to find a match, trying to update my matching pattern from google."
		findre
		pub_convert $nick $uhost $hand $chan $text findre_done
	} else {
		putserv "PRIVMSG $chan :Sorry, but could not convert $text"
	}
	::http::cleanup $token
}

::rud::convert::init