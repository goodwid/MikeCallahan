# smoker.tcl v.1b for Eggdrop 1.4.3 and higher
#	Flaim	flaim@flaim.net
#
#
# TO USE:  o    Set the desired smoker field keywords to the
#               `smoker-fields' line below where indicated.
#          o    Load this script on a 1.1.6 or later Eggdrop bot.
#          o    Begin having users save the desired information.  If you
#               choose to add the default "IRL" field, they just use
#               the IRC command: /MSG <botnick> my smoker is <smoker>
#          o    See the new information now appear with the whois command.
#
# This script enhances the `whois' output utilizing the `whois-fields'
# option of eggdrop 1.1-grant and later versions.  It adds the functionality
# of whois.tcl used in pre-1.1-grant versions.
#
# The fields desired to be maintained in the userfile `xtra' information
# should be put in `smoker-fields'.  This is different than the Eggdrop
# configuration variable `whois-fields' in that this script will add the
# commands to change these fields.   It will also add these desired fields
# to the `whois-fields' itself, so do not define them there as well.  The
# fields added in `smoker-fields' will be converted to upper case for
# aesthetics in the `whois' command output.
#
# The commands that will be added to the running eggdrop are:
#  (<info> will be the respective userfile field added in `smoker-fields')
#
#   TYPE    COMMAND         USAGE
#   ======  ==============  ========================================
#   msg     my smoker is     To change your <info> via /MSG.
#   dcc     .smoker          To change your <info> via DCC.
#   dcc     .chsmoker        To change someone else's <info> via DCC.
#

################################
# Set your desired fields here #
################################

set smoker-fields "smoker"

# This script's identification

set smokerver "smoker TCL v0.1b build 005"

# This script is NOT for pre-1.4.3 versions.

catch { set numversion }
if {![info exists numversion] || ($numversion < 1040300)} {
  putlog "*** Can't load $smokerver -- At least Eggdrop v1.4.3 required"
    return 0
}

# Make sure we don't bail because whois and/or smoker-fields aren't set.

if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists smoker-fields]} { set smoker-fields "" }

foreach field [string tolower ${smoker-fields}] {
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

set url_global "http://3whack.org/mike/helpbeta.html"

#
#
#
# bind the commands




proc msg_tellsmoker {nick uhost hand arg} {
	upvar #0 url_global url
	   set smoker "SMOKER"
		
	set value [getuser $hand XTRA SMOKER]
	putlog "DEBUG A $value"
	if {$value == ""} {
            putserv "NOTICE $nick :You have no smoking preference set.  I reccomend setting it to '0' if you are a non-smoker."
		return
         } {
		if {$value == 0} {
            	putserv "NOTICE $nick :You are a non-smoker.  See $url if you need to change this."
		return
		}
		if {$value == 1} {
            	putserv "NOTICE $nick :You are a cigar smoker.  See $url if you need to change this."
		return
		}
		if {$value == 2} {
            	putserv "NOTICE $nick :You are a pot-head.  See $url if you need to change this."
		return
		}
		if {$value == 3} {
            	putserv "NOTICE $nick :You are a pot-head who smokes cigars as well.  See $url if you need to change this."
		return
		}
		if {$value == 4} {
            	putserv "NOTICE $nick :You are a smoker.  See $url if you need to change this."
		return
		}
		if {$value == 5} {
            	putserv "NOTICE $nick :You are a smoker of cigars and cigarettes.  See $url if you need to change this."
		return
		}
		if {$value == 6} {
            	putserv "NOTICE $nick :You are a pot-head aspiring to be a chimney.  See $url if you need to change this."
		return
		}
		if {$value == 7} {
            	putserv "NOTICE $nick :You smoke everything, might want to visit the American Cancer Society website.  See $url if you need to change this."
		return
		}
         }
}

# This is the `/msg <info>' procedure
proc msg_setsmoker {nick uhost hand arg} {
	upvar #0 url_global url
	set temp ""
	set counter 4
	set temp [lindex $arg 4]
	if {$temp < 0 || $temp > 7} {
		putserv "NOTICE $nick :Your smoking preference must be a number between 0 and 7.  Please visit $url for further details."
		return
	}
	set arg $temp


	putlog "DEBUG: setting SMOKER for $nick: $arg"


  global lastbind quiet-reject smoker-fields
   set smoker "SMOKER"
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
	set value [getuser $hand XTRA SMOKER]
   if {$hand != "*"} {
      if {$arg != ""} {
         if {[string tolower $arg] == "none"} {
            putserv "NOTICE $nick :Removed your smoking preference line."
            setuser $hand XTRA SMOKER ""
         } {
            putserv "NOTICE $nick :Your smoking preference is $arg"
            setuser $hand XTRA SMOKER "[string range $arg 0 159]"
         }
      } {
         if {$value == ""} {
            putserv "NOTICE $nick :You have no smoking preference set."
         } {
            if {$value == 0} {
            	putserv "NOTICE $nick :You are a non-smoker.  See $url if you need to change this."
		return
		}
		if {$value == 1} {
            	putserv "NOTICE $nick :You are a cigar smoker.  See $url if you need to change this."
		return
		}
		if {$value == 2} {
            	putserv "NOTICE $nick :You are a pot-head.  See $url if you need to change this."
		return
		}
		if {$value == 3} {
            	putserv "NOTICE $nick :You are a pot-head who smokes cigars as well.  See $url if you need to change this."
		return
		}
		if {$value == 4} {
            	putserv "NOTICE $nick :You are a smoker.  See $url if you need to change this."
		return
		}
		if {$value == 5} {
            	putserv "NOTICE $nick :You are a smoker of cigars and cigarettes.  See $url if you need to change this."
		return
		}
		if {$value == 6} {
            	putserv "NOTICE $nick :You are a pot-head anspiring to be a chimney.  See $url if you need to change this."
		return
		}
		if {$value == 7} {
            	putserv "NOTICE $nick :You smoke everything, might want to visit the American Cancer Society website.  See $url if you need to change this."
		return
		}
         }
      }
   } else {
      if {${quiet-reject} != 1} {
      # adding a user to the dbase if they don't exist... this should go first.
      }
   }
  putcmdlog "($nick!$uhost) !$hand! smoking preference $arg"
  return 0
}

# This is the dcc '.<info>' procedure.

proc dcc_setsmoker {hand idx arg} {
		upvar #0 url_global url
  global lastbind smoker-fields
    set smoker [string toupper $lastbind]
	set value [getuser $hand XTRA SMOKER]
  set arg [cleanarg $arg]
  if {$arg != ""} {
    if {[string tolower $arg] == "none"} {
      putdcc $idx "Removed your smoking preference line."
      setuser $hand XTRA SMOKER ""
    } {
      putdcc $idx "Now: $arg"
      setuser $hand XTRA SMOKER "[string range $arg 0 159]"
    }
  } {
    if {$value == ""} {
      putdcc $idx "You have no smoking preference set."
    } {
      putdcc $idx "Currently: $value"
    }
  }
  putcmdlog "#$hand# [string tolower SMOKER] $arg"
  return 0
}

# This is the DCC `.ch<info>' procedure

proc dcc_chsmoker {hand idx arg} {
		upvar #0 url_global url
	set value [getuser $hand XTRA SMOKER]
  global lastbind smoker-fields
   set smoker [string toupper [string range $lastbind 2 end]]
  set arg [cleanarg $arg]
  if { $arg == "" } {
    putdcc $idx "syntax: .ch[string tolower SMOKER] <who> \[<[string tolower SMOKER]>|NONE\]"
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
      putdcc $idx "Removed $who's smoking preference line."
      setuser $who XTRA SMOKER ""
      putcmdlog "smoking preference for $who removed by $hand"
    } {
      putdcc $idx "Now: $info"
      setuser $who XTRA SMOKER "$info"
      putcmdlog "smoking preference for $who set to \"$info\" by $hand"
    }
  } {
    if {[getuser $who XTRA SMOKER] == ""} {
      putdcc $idx "$who has no smoking preference set."
    } {
      putdcc $idx "Currently: [getuser $who XTRA SMOKER]"
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

# announcing the smoker in channel
#

#bind pubm - *Mike,~who~am~I* give_smoker

proc give_smoker {nick mask hand chan arg} {
		upvar #0 url_global url
	set value [getuser $hand XTRA SMOKER]
	if {[lindex $arg 1] == "who" && [lindex $arg 2] == "am"} {
		if {$value == ""} {
		putserv "NOTICE $nick :You can set your smoking preference with '/msg Callahan my smoking preference is «smoker»'"
		putserv "NOTICE $nick :You need to be registered with me first to do so."
		putserv "NOTICE $nick :You can register with me with '/msg Callahan hello'"
		putserv "NOTICE $nick :Then do '/msg Callahan PASS «insert password»'"
		return
	}
	putserv	"PRIVMSG $chan :You're smoking preference is $value."
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
	putlog "DEBUG::smoker $patron_temp | $patron_length"
	#We need to tell FUGLY how many characters we want to use to match with. If the patron's nick used is less than or equal to 5, we pass the length of it; if it is greater than 5, we only check for the first 5 to match.
	if {$patron_length <= 5} {
		#This is where we pass the patron  & channel that is requested to be hosed to FUGLY, and the length we're using for a "match"
		patron_match $patron_temp $chan $patron_length
		putlog "DEBUG::smoker::return from patron_match $patron_local"
	}
	
	if {[string length $patron_temp] > 5} {
		#This is where we pass the patron  & channel that is requested to be hosed to FUGLY, and the length we're using for a "match"
		patron_match $patron_temp $chan 5
		putlog "DEBUG::smoker::return from patron_match $patron_local"
	}

	
	#Did the request match anyone in channel?  If not, say so.  Else give the smoker (This covers the case where the request matches the nick exactly)
	if {$patron_temp == $patron_local || $patron_local == "NoMatchesFound"} {
		if {$patron_local == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :Sorry, I don't see $patron_temp here.  Try again when they show up!"
		return
		}
		if {[getuser [nick2hand $patron_local $chan] XTRA SMOKER] == ""} {
			putserv "NOTICE $patron_local :You can set your smoking preference with '/msg Callahan my smoking preference is «smoker»'"
			putserv "NOTICE $patron_local :You need to be registered with me first to do so."
			putserv "NOTICE $patron_local :You can register with me with '/msg Callahan hello'"
			putserv "NOTICE $patron_local :Then do '/msg Callahan PASS «insert password here»'"
			return
		}	
	}
		if {[getuser [nick2hand $patron_local $chan] XTRA SMOKER] == ""} {
			putserv "NOTICE $patron_local :You can set your smoking preference with '/msg Callahan my smoking preference is «smoker»'"
			putserv "NOTICE $patron_local :You need to be registered with me first to do so."
			putserv "NOTICE $patron_local :You can register with me with '/msg Callahan hello'"
			putserv "NOTICE $patron_local :Then do '/msg Callahan PASS «insert password here»'"
			return
		}		
		putserv "PRIVMSG $chan :$patron_local is [getuser [nick2hand $patron_local $chan] XTRA smoker]."
		return

	}
}

# Set smoker_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the smoker tcl.

set smoker_loaded 1

# Announce that we've loaded the script.

putlog "Smokin! $smokerver loaded (${smoker-fields})."
