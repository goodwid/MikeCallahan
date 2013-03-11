# usual.tcl v1.0 for Eggdrop 1.4.3 and higher
#	Flaim	flaim@flaim.net
#
#
# TO USE:  o    Set the desired usual field keywords to the
#               `usual-fields' line below where indicated.
#          o    Load this script on a 1.1.6 or later Eggdrop bot.
#          o    Begin having users save the desired information.  If you
#               choose to add the default "IRL" field, they just use
#               the IRC command: /MSG <botnick> my usual is <usual>
#          o    See the new information now appear with the whois command.
#
# This script enhances the `whois' output utilizing the `whois-fields'
# option of eggdrop 1.1-grant and later versions.  It adds the functionality
# of whois.tcl used in pre-1.1-grant versions.
#
# The fields desired to be maintained in the userfile `xtra' information
# should be put in `usual-fields'.  This is different than the Eggdrop
# configuration variable `whois-fields' in that this script will add the
# commands to change these fields.   It will also add these desired fields
# to the `whois-fields' itself, so do not define them there as well.  The
# fields added in `usual-fields' will be converted to upper case for
# aesthetics in the `whois' command output.
#
# The commands that will be added to the running eggdrop are:
#  (<info> will be the respective userfile field added in `usual-fields')
#
#   TYPE    COMMAND         USAGE
#   ======  ==============  ========================================
#   msg     my usual is     To change your <info> via /MSG.
#   dcc     .usual          To change your <info> via DCC.
#   dcc     .chusual        To change someone else's <info> via DCC.
#

################################
# Set your desired fields here #
################################

set usual-fields "\*MY~USUAL~IS\*"

# This script's identification

set usualver "Usual TCL v1.0"

# This script is NOT for pre-1.4.3 versions.

catch { set numversion }
if {![info exists numversion] || ($numversion < 1040300)} {
  putlog "*** Can't load $usualver -- At least Eggdrop v1.4.3 required"
    return 0
}

# Make sure we don't bail because whois and/or usual-fields aren't set.

if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists usual-fields]} { set usual-fields "" }

foreach field [string tolower ${usual-fields}] {
	 if { [lsearch -exact [string tolower ${whois-fields}] $field] == -1 } { append whois-fields " " [string toupper $field] }
 }


# If olduserinfo-fields doesn't exist, create it.

if { ![info exists olduserinfo-fields] } {
	set userinfo-fields ""
	set olduserinfo-fields ${userinfo-fields}
}

# Delete only the userinfo-fields that have been removed but are still
# listed in the whois-fields list.

foreach field [string tolower ${olduserinfo-fields}] {
  if { [lsearch -exact [string tolower ${whois-fields}] $field] >= 0 && [lsearch -exact [string tolower ${userinfo-fields}] $field] == -1 } {
	    set fieldtmp [lsearch -exact [string tolower ${whois-fields}] $field]
            set whois-fields [lreplace ${whois-fields} $fieldtmp $fieldtmp]
       }
      }
# bind the commands

bind msgm - *my~usual~is* msg_setusual
bind msgm - *What's~my~usual* msg_tellusual
bind msgm - *What~is~my~usual* msg_tellusual


proc msg_tellusual {nick uhost hand arg} {
	   set usual "USUAL"
	if {[getuser $hand XTRA $usual] == ""} {
            putserv "NOTICE $nick :You have no usual set."
		return
         } {
            putserv "NOTICE $nick :Your usual is [getuser $hand XTRA USUAL]"
		return
         }
}

# This is the `/msg <info>' procedure
proc msg_setusual {nick uhost hand arg} {

	set temp ""
	set counter 3
	while {$counter < [llength $arg]} {
		lappend temp [lindex $arg $counter]
		incr counter
		}
	set arg $temp


	putlog "DEBUG: setting USUAL for $nick: $arg"
  global lastbind quiet-reject usual-fields
   set usual "USUAL"
   putlog "DEBUG A1: $temp"
  set temp [cleanarg $temp]
  putlog "DEBUG A2: $temp"
  set ignore 1
  foreach channel [channels] {
    if {[onchan $nick $channel]} {
      set ignore 0
    }
  }
  if {$ignore} {
    return 0
  }
   if {$hand != "*"} {
      if {$temp != ""} {
         if {[string tolower $arg] == "none"} {
            putserv "NOTICE $nick :Removed your usual line."
            setuser $hand XTRA $usual ""
         } {
            putserv "NOTICE $nick :Your usual is $temp"
	    putlog "DEBUG: [string range $temp 0 159]"
            setuser $hand XTRA $usual "[string range $temp 0 159]"
         }
      } {
         if {[getuser $hand XTRA $usual] == ""} {
            putserv "NOTICE $nick :You have no usual set."
         } {
            putserv "NOTICE $nick :Your usual is [getuser $hand XTRA USUAL]"
         }
      }
   } else {
      if {${quiet-reject} != 1} {
      # adding a user to the dbase if they don't exist... this should go first.
      }
   }
  putcmdlog "($nick!$uhost) !$hand! $usual $temp"
  return 0
}

proc cleanarg {arg} {
  set response ""
  for {set i 0} {$i < [string length $arg]} {incr i} {
    set char [string index $arg $i]
    if {($char != "\12") && ($char != "\15")} {
      append response $char
    }
  }
  return $response
}

# serving the usual in channel
bind pubm - *Mike,~my~usual* serve_usual
bind pubm - *Mike,~usual serve_usual_ambig

bind pubm - *Mike,~get*their~usual* serve_usual_other
bind pubm - *Mike,~give*their~usual* serve_usual_other
bind pubm - *Mike,~get*her~usual* serve_usual_other
bind pubm - *Mike,~get*his~usual* serve_usual_other
bind pubm - *Mike,~give*her~usual* serve_usual_other
bind pubm - *Mike,~give*his~usual* serve_usual_other

bind pubm - *Mike,~give*my~usual* serve_usual_self_to_other
bind pubm - *Mike,~get*my~usual* serve_usual_self_to_other

#bind pubm - *Mike,~get*'s~usual* serve_usual_other_to_other
#bind pubm - *Mike,~give*'s~usual* serve_usual_other_to_other

bind pubm - *Mike,~get~me*'s~usual* serve_usual_other_to_self
bind pubm - *Mike,~give~me*'s~usual* serve_usual_other_to_self
bind pubm - *Mike,~get~me*s'~usual* serve_usual_other_to_self
bind pubm - *Mike,~give~me*s'~usual* serve_usual_other_to_self

proc serve_usual {nick mask hand chan arg} {
	if {[getuser $hand XTRA USUAL] == ""} {
		putserv	"PRIVMSG $chan :\001ACTION serves $nick their usual.\001"
		putserv "NOTICE $nick :You can set your usual with '/msg Callahan my usual is «usual»'"
		putserv "NOTICE $nick :You need to be registered with me first to do so."
		putserv "NOTICE $nick :You can register with me with '/msg Callahan hello'"
		putserv "NOTICE $nick :Then do '/msg Callahan PASS «insert password here»'  You MUST set a PASS right away."
		return
	}
	putserv	"PRIVMSG $chan :\001ACTION serves $nick [getuser $hand XTRA USUAL]\001"
	putlog "Triggering usual for $nick"
	return
}

proc serve_usual_ambig {nick mask hand chan arg} {
	upvar #0 random_patron random_patron_local
	pick_random_patron $chan
	set toast [getuser [nick2hand $random_patron_local $chan] XTRA USUAL]
	if {[getuser [nick2hand $random_patron_local $chan] XTRA USUAL] == ""} {
	set toast "some random usual, with no guarantees as to its potability"
	}
	putlog "Triggering ambig for $nick"
	putserv "PRIVMSG $chan :\001ACTION serves $nick $toast.\001"
	return
}

proc serve_usual_other_to_other {nick mask hand chan arg} {
	upvar #0 patron patron_local
	patron_match [lindex $arg 2] $chan [string length [lindex $arg 2]]
	set patron_target $patron_local

	if {[lindex $arg 2] == "me" && [lindex $arg 2] == "my" && [getuser [nick2hand $nick $chan] XTRA USUAL] != ""} {puthelp "PRIVMSG $chan :\001ACTION serves $nick [getuser [nick2hand $nick $chan] XTRA USUAL]\001";return}
	if {[lindex $arg 2] == "me" && [lindex $arg 2] == "my" && [getuser [nick2hand $nick $chan] XTRA USUAL] == ""} {puthelp "PRIVMSG $nick :Please see http://3whack.org/mike/help.html to set your usual";return}

	if {[lindex $arg 2] == "me"} {return}
	set patron_temp [lindex $arg 3]
	patron_match [lindex [split $patron_temp '] 0] $chan [string length [lindex [split $patron_temp '] 0]]
	set patron_other $patron_local
	if {$patron_other == "NoMatchesFound" || $patron_target == "NoMatchesFound"} {
		if {$patron_other == "NoMatchesFound"} {
			putserv "PRIVMSG $chan :Sorry, I don't see [lindex [split $patron_temp '] 0] here."
			return
		}
	}
		
		##Is the receiver here? If not, give the requestor the usual
	if {$patron_target == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :Sorry, I don't see [lindex $arg 2] here.  Why don't you try $patron_other's usual?"
		if {[getuser [nick2hand $patron_other $chan] XTRA USUAL] != ""} {
		puthelp "PRIVMSG $chan :\001ACTION serves $nick [getuser [nick2hand $patron_other $chan] XTRA USUAL]\001"
		return
		}
		puthelp "PRIVMSG $chan :\001ACTION serves $nick $patron_other's usual.\001"
		return
	}

	if {[getuser [nick2hand $patron_other $chan] XTRA USUAL] != ""} {
		putserv "PRIVMSG $chan :\001ACTION serves $patron_target [getuser [nick2hand $patron_other $chan] XTRA USUAL], courtesy of $nick.\001"
		return
	}
	putserv "PRIVMSG $chan :\001ACTION serves $patron_target $patron_other's usual, courtesy of $nick.\001"		return
}

proc serve_usual_self_to_other {nick mask hand chan arg} {
	upvar #0 patron patron_local
	set patron_givee [lindex $arg 2]
	patron_match $patron_givee $chan [string length $patron_givee]
	if {$patron_local == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :Sorry, I don't see $patron_givee here $nick.  I'll save one for them though!"
		return
	}	
	if {[getuser $hand XTRA USUAL] == ""} {
		putlog "DEBUG: serve_usual_self_to_other No USUAL set"
		putserv "PRIVMSG $chan :\001ACTION serves $patron_givee $nick's usual.\001"
		return
	}
	if {[getuser $hand XTRA USUAL] != ""} {
		putlog "DEBUG: serve_usual_self_to_other Gave USUAL to $patron_local"
		putserv "PRIVMSG $chan :\001ACTION serves $patron_givee [getuser $hand XTRA USUAL], courtesy of $nick.\001"
		return
	}
}

proc serve_usual_other_to_self {nick mask hand chan arg} {
	upvar #0 patron patron_local
	set patron_temp [lindex $arg 3]
	patron_match [lindex [split $patron_temp '] 0] $chan [string length [lindex [split $patron_temp '] 0]]
	if {$patron_local == "NoMatchesFound"} {
		putlog "DEBUG: 407 NoMatchesFound"
		putserv "PRIVMSG $chan :Sorry, I don't see $patron_temp here.  Try again when they show up!"
		return
	}	
	if {[getuser [nick2hand $patron_local $chan] XTRA USUAL] == ""} {
		putlog "DEBUG: 412 No USUAL set"
		putserv "PRIVMSG $chan :\001ACTION serves $nick $patron_local's usual.\001"
		return
	}
	if {[getuser [nick2hand $patron_local $chan] XTRA USUAL] != ""} {
		putlog "DEBUG: 417 Gave USUAL to $patron_local"
		putserv "PRIVMSG $chan :\001ACTION serves $nick [getuser [nick2hand $patron_local $chan] XTRA USUAL]\001"
		return
	}
}

proc serve_usual_other {nick mask hand chan arg} {
	upvar #0 patron patron_local
	patron_match [lindex $arg 2] $chan [string length [lindex $arg 2]]
	putlog "DEBUG: made it to serve_other_usual $patron_local"
	if {$patron_local == "NoMatchesFound"} {
		putlog "DEBUG: NoMatchesFound"
		putserv "PRIVMSG $chan :Sorry, I don't see $patron_temp here.  Try again when they show up!"
		return
	}	
	if {[getuser [nick2hand $patron_local $chan] XTRA USUAL] == ""} {
		putlog "DEBUG: No USUAL set"
		putserv "PRIVMSG $chan :\001ACTION serves $patron_local their usual, courtesy of $nick.\001"
		return
		}
	if {[getuser [nick2hand $patron_local $chan] XTRA USUAL] != ""} {
		putlog "DEBUG: Gave USUAL to $patron_local"
		putserv "PRIVMSG $chan :\001ACTION serves $patron_local [getuser [nick2hand $patron_local $chan] XTRA USUAL], courtesy of $nick.\001"
		return
	}
}

# Set usual_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the usual tcl.

set usual_loaded 1

# Announce that we've loaded the script.

putlog "$usualver loaded (${usual-fields})."
