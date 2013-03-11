# tagline.tcl v.1b for Eggdrop 1.4.3 and higher
#	Flaim	flaim@flaim.net
#
#
# TO USE:  o    Set the desired tagline field keywords to the
#               `tagline-fields' line below where indicated.
#          o    Load this script on a 1.1.6 or later Eggdrop bot.
#          o    Begin having users save the desired information.  If you
#               choose to add the default "IRL" field, they just use
#               the IRC command: /MSG <botnick> my tagline is <tagline>
#          o    See the new information now appear with the whois command.
#
# This script enhances the `whois' output utilizing the `whois-fields'
# option of eggdrop 1.1-grant and later versions.  It adds the functionality
# of whois.tcl used in pre-1.1-grant versions.
#
# The fields desired to be maintained in the userfile `xtra' information
# should be put in `tagline-fields'.  This is different than the Eggdrop
# configuration variable `whois-fields' in that this script will add the
# commands to change these fields.   It will also add these desired fields
# to the `whois-fields' itself, so do not define them there as well.  The
# fields added in `tagline-fields' will be converted to upper case for
# aesthetics in the `whois' command output.
#
# The commands that will be added to the running eggdrop are:
#  (<info> will be the respective userfile field added in `tagline-fields')
#
#   TYPE    COMMAND         USAGE
#   ======  ==============  ========================================
#   msg     my tagline is     To change your <info> via /MSG.
#   dcc     .tagline          To change your <info> via DCC.
#   dcc     .chtagline        To change someone else's <info> via DCC.
#

################################
# Set your desired fields here #
################################

set tagline-fields "tagline"

# This script's identification

set taglinever "tagline TCL v0.1b"

# This script is NOT for pre-1.4.3 versions.

catch { set numversion }
if {![info exists numversion] || ($numversion < 1040300)} {
  putlog "*** Can't load $taglinever -- At least Eggdrop v1.4.3 required"
    return 0
}

# Make sure we don't bail because whois and/or tagline-fields aren't set.

if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists tagline-fields]} { set tagline-fields "" }

foreach field [string tolower ${tagline-fields}] {
	 if { [lsearch -exact [string tolower ${whois-fields}] $field] == -1 } { append whois-fields " " [string toupper $field] }
 }


# If olduserinfo-fields doesn't exist, create it.

if { ![info exists olduserinfo-fields] } { set olduserinfo-fields ${userinfo-fields} }

# Delete only the userinfo-fields that have been removed but are still
# listed in the whois-fields list.

foreach field [string tolower ${olduserinfo-fields}] {
  if { [lsearch -exact [string tolower ${whois-fields}] $field] >= 0 && [lsearch -exact [string tolower ${userinfo-fields}] $field] == -1 } {
	    set fieldtmp [lsearch -exact [string tolower ${whois-fields}] $field]
            set whois-fields [lreplace ${whois-fields} $fieldtmp $fieldtmp]
       }
      }



#
#
#
# bind the commands

bind dcc - tagline dcc_settagline
bind dcc m chtagline dcc_chtagline
bind msgm - *my~tagline~is* msg_settagline
bind msgm - *what~is~my~tagline* msg_settagline
bind msgm - *what's~my~tagline* msg_settagline

proc msg_telltagline {nick uhost hand arg} {
	   set tagline "TAGLINE"
	if {[getuser $hand XTRA $tagline] == ""} {
            putserv "NOTICE $nick :You have no usual set."
		return
         } {
            putserv "NOTICE $nick :Your usual is [getuser $hand XTRA TAGLINE]"
		return
         }
}

# This is the `/msg <info>' procedure
proc msg_settagline {nick uhost hand arg} {
	set temp ""
	set counter 3
	while {$counter < [llength $arg]} {
		lappend temp [lindex $arg $counter]
		putlog "DEBUG: msg_settagline: [lindex $arg $counter]"
		incr counter
		}
	set arg $temp


	putlog "DEBUG: setting USUAL for $nick: $arg"


  global lastbind quiet-reject tagline-fields
   set tagline "TAGLINE"
  set arg [cleanarg $arg]
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
      if {$arg != ""} {
         if {[string tolower $arg] == "none"} {
            putserv "NOTICE $nick :Removed your $tagline line."
            setuser $hand XTRA $tagline ""
         } {
            putserv "NOTICE $nick :Your tagline is $arg"
            setuser $hand XTRA $tagline "[string range $arg 0 159]"
         }
      } {
         if {[getuser $hand XTRA $tagline] == ""} {
            putserv "NOTICE $nick :You have no $tagline set."
         } {
            putserv "NOTICE $nick :Your tagline is [getuser $hand XTRA tagline]"
         }
      }
   } else {
      if {${quiet-reject} != 1} {
      # adding a user to the dbase if they don't exist... this should go first.
      }
   }
  putcmdlog "($nick!$uhost) !$hand! $tagline $arg"
  return 0
}

# This is the dcc '.<info>' procedure.

proc dcc_settagline {hand idx arg} {
  global lastbind tagline-fields
    set tagline [string toupper $lastbind]
  set arg [cleanarg $arg]
  if {$arg != ""} {
    if {[string tolower $arg] == "none"} {
      putdcc $idx "Removed your $tagline line."
      setuser $hand XTRA $tagline ""
    } {
      putdcc $idx "Now: $arg"
      setuser $hand XTRA $tagline "[string range $arg 0 159]"
    }
  } {
    if {[getuser $hand XTRA $tagline] == ""} {
      putdcc $idx "You have no $tagline set."
    } {
      putdcc $idx "Currently: [getuser $hand XTRA $tagline]"
    }
  }
  putcmdlog "#$hand# [string tolower $tagline] $arg"
  return 0
}

# This is the DCC `.ch<info>' procedure

proc dcc_chtagline {hand idx arg} {
  global lastbind tagline-fields
   set tagline [string toupper [string range $lastbind 2 end]]
  set arg [cleanarg $arg]
  if { $arg == "" } {
    putdcc $idx "syntax: .ch[string tolower $tagline] <who> \[<[string tolower $tagline]>|NONE\]"
    return 0
  }
  set who [lindex [split $arg] 0]
  if {![validuser $who]} {
    putdcc $idx "$who is not a valid user."
    return 0
  }
  if {[llength [split $arg]] == 1} {
    set info ""
  } {
    set info [lrange [split $arg] 1 end]
  }
  if {$info != ""} {
    if {[string tolower $info] == "none"} {
      putdcc $idx "Removed $who's $tagline line."
      setuser $who XTRA $tagline ""
      putcmdlog "$tagline for $who removed by $hand"
    } {
      putdcc $idx "Now: $info"
      setuser $who XTRA $tagline "$info"
      putcmdlog "$tagline for $who set to \"$info\" by $hand"
    }
  } {
    if {[getuser $who XTRA $tagline] == ""} {
      putdcc $idx "$who has no $tagline set."
    } {
      putdcc $idx "Currently: [getuser $who XTRA $tagline]"
    }
  }
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

# announcing the tagline in channel
#

bind pubm - *Mike,~who~am~I* give_tagline

proc give_tagline {nick mask hand chan arg} {
	if {[lindex $arg 1] == "who" && [lindex $arg 2] == "am"} {
		if {[getuser $hand XTRA TAGLINE] == ""} {
		putserv	"PRIVMSG $chan :You are someone who didn't set their tagline!"
		putserv "NOTICE $nick :You can set your tagline with '/msg Callahan my tagline is «tagline»'"
		putserv "NOTICE $nick :You need to be registered with me first to do so."
		putserv "NOTICE $nick :You can register with me with '/msg Callahan hello'"
		putserv "NOTICE $nick :Then do '/msg Callahan PASS «insert password»'"
		return
	}
	putserv	"PRIVMSG $chan :You are [getuser $hand XTRA TAGLINE]."
	return
	}


	if {[lindex $arg 2] != "am" && [lindex $arg 2] != "is"} {
		upvar #0 random_patron random_patron_local
		pick_random_patron $chan
		putserv "PRIVMSG $chan :$nick: $random_patron_local!"
		return
	}
	
	if {[llength $arg] > 4} {
		upvar #0 random_patron random_patron_local
		set no_match_nick 0
		if {$random_patron_local != $nick} {
			putserv "PRIVMSG $chan :$nick: $random_patron_local!"
			return
		}
		if {$random_patron_local == $nick} {
			putserv "PRIVMSG $chan :$nick: You!"
			return
		}
	}
	
	if {[lindex $arg 2] == "is"} {
	upvar #0 patron patron_local
	set patron_length 0
	set patron_local [lindex $arg 3]
	set patron_temp $patron_local
	set patron_temp [lindex [split $patron_temp ?] 0]
	set patron_length [string length [lindex $patron_temp 0]]
	putlog "DEBUG::tagline $patron_temp | $patron_length"
	#We need to tell FUGLY how many characters we want to use to match with. If the patron's nick used is less than or equal to 5, we pass the length of it; if it is greater than 5, we only check for the first 5 to match.
	if {$patron_length <= 5} {
		#This is where we pass the patron  & channel that is requested to be hosed to FUGLY, and the length we're using for a "match"
		patron_match $patron_temp $chan $patron_length
		putlog "DEBUG::tagline::return from patron_match $patron_local"
	}
	
	if {[string length $patron_temp] > 5} {
		#This is where we pass the patron  & channel that is requested to be hosed to FUGLY, and the length we're using for a "match"
		patron_match $patron_temp $chan 5
		putlog "DEBUG::tagline::return from patron_match $patron_local"
	}

	
	#Did the request match anyone in channel?  If not, say so.  Else give the tagline (This covers the case where the request matches the nick exactly)
	if {$patron_temp == $patron_local || $patron_local == "NoMatchesFound"} {
		if {$patron_local == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :Sorry, I don't see $patron_temp here.  Try again when they show up!"
		return
		}
		if {[getuser [nick2hand $patron_local $chan] XTRA TAGLINE] == ""} {
			putserv	"PRIVMSG $chan :$patron_local is someone who didn't set their tagline!"
			putserv "NOTICE $patron_local :You can set your tagline with '/msg Callahan my tagline is «tagline»'"
			putserv "NOTICE $patron_local :You need to be registered with me first to do so."
			putserv "NOTICE $patron_local :You can register with me with '/msg Callahan hello'"
			putserv "NOTICE $patron_local :Then do '/msg Callahan PASS «insert password here»'"
			return
		}	
	}
		if {[getuser [nick2hand $patron_local $chan] XTRA TAGLINE] == ""} {
			putserv	"PRIVMSG $chan :$patron_local is someone who didn't set their tagline!"
			putserv "NOTICE $patron_local :You can set your tagline with '/msg Callahan my tagline is «tagline»'"
			putserv "NOTICE $patron_local :You need to be registered with me first to do so."
			putserv "NOTICE $patron_local :You can register with me with '/msg Callahan hello'"
			putserv "NOTICE $patron_local :Then do '/msg Callahan PASS «insert password here»'"
			return
		}		
		putserv "PRIVMSG $chan :$patron_local is [getuser [nick2hand $patron_local $chan] XTRA tagline]."
		return

	}
}

# Set tagline_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the tagline tcl.

set tagline_loaded 1

# Announce that we've loaded the script.

putlog "$taglinever loaded (${tagline-fields})."
