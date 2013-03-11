# familiar.tcl v.1b for Eggdrop 1.4.3 and higher
#	Flaim	flaim@flaim.net
#
#
# TO USE:  o    Set the desired familiar field keywords to the
#               `familiar-fields' line below where indicated.
#          o    Load this script on a 1.1.6 or later Eggdrop bot.
#          o    Begin having users save the desired information.  If you
#               choose to add the default "IRL" field, they just use
#               the IRC command: /MSG <botnick> my familiar is <familiar>
#          o    See the new information now appear with the whois command.
#
# This script enhances the `whois' output utilizing the `whois-fields'
# option of eggdrop 1.1-grant and later versions.  It adds the functionality
# of whois.tcl used in pre-1.1-grant versions.
#
# The fields desired to be maintained in the userfile `xtra' information
# should be put in `familiar-fields'.  This is different than the Eggdrop
# configuration variable `whois-fields' in that this script will add the
# commands to change these fields.   It will also add these desired fields
# to the `whois-fields' itself, so do not define them there as well.  The
# fields added in `familiar-fields' will be converted to upper case for
# aesthetics in the `whois' command output.
#
# The commands that will be added to the running eggdrop are:
#  (<info> will be the respective userfile field added in `familiar-fields')
#
#   TYPE    COMMAND         USAGE
#   ======  ==============  ========================================
#   msg     my familiar is     To change your <info> via /MSG.
#   dcc     .familiar          To change your <info> via DCC.
#   dcc     .chfamiliar        To change someone else's <info> via DCC.
#

################################
# Set your desired fields here #
################################

##### FAMILIAR
set familiar-fields "familiar"

# This script's identification

set familiarver "familiar TCL v0.1b"
set userinfo-fields ""

# Make sure we don't bail because whois and/or familiar-fields aren't set.

if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists familiar-fields]} { set familiar-fields "" }

foreach field [string tolower ${familiar-fields}] {
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


proc msg_tellfamiliar {nick uhost hand arg} {
	   set familiar "FAMILIAR"
	if {[getuser $hand XTRA $familiar] == ""} {
            putserv "NOTICE $nick :You have no familiar name set."
		return
         } {
            putserv "NOTICE $nick :Your familiar name is [getuser $hand XTRA FAMILIAR]"
		return
         }
}

# This is the `/msg <info>' procedure
proc msg_setfamiliar {nick uhost hand arg} {
	set arg [lindex $arg 3]


	putlog "DEBUG: setting FAMILIAR for $nick: $arg"


  global lastbind quiet-reject familiar-fields
   set familiar "FAMILIAR"
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
            putserv "NOTICE $nick :Removed your $familiar name."
            setuser $hand XTRA $familiar ""
         } {
            putserv "NOTICE $nick :Your familiar name is $arg"
            setuser $hand XTRA $familiar "[string range $arg 0 159]"
         }
      } {
         if {[getuser $hand XTRA $familiar] == ""} {
            putserv "NOTICE $nick :You have no familiar name set."
         } {
            putserv "NOTICE $nick :Your familiar name is [getuser $hand XTRA familiar]"
         }
      }
   } else {
      if {${quiet-reject} != 1} {
      # adding a user to the dbase if they don't exist... this should go first.
      }
   }
  putcmdlog "($nick!$uhost) !$hand! $familiar $arg"
  return 0
}

# Set familiar_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the familiar tcl.

set familiar_loaded 1




##### SMOKER
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

##### LOCATION
set LOCATIONID-fields "LOCATIONID"

# This script's identification

set LOCATIONIDver "LOCATIONID TCL v0.1b build 005"

# This script is NOT for pre-1.4.3 versions.

catch { set numversion }
if {![info exists numversion] || ($numversion < 1040300)} {
  putlog "*** Can't load $LOCATIONIDver -- At least Eggdrop v1.4.3 required"
    return 0
}

# Make sure we don't bail because whois and/or LOCATIONID-fields aren't set.

if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists LOCATIONID-fields]} { set LOCATIONID-fields "" }

foreach field [string tolower ${LOCATIONID-fields}] {
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



proc msg_tellLOCATIONID {nick uhost hand arg} {
	upvar #0 url_global url
	   set LOCATIONID "LOCATIONID"
		
	set value [getuser $hand XTRA LOCATIONID]
	putlog "DEBUG A $value"
	if {$value == ""} {
            putserv "NOTICE $nick :You have no Location ID set.  Please see $url for further instructions"
		return
         } 
	putserv "NOTICE $nick :Your Location ID is $value."
		return
}


# This is the `/msg <info>' procedure
proc msg_setLOCATIONID {nick uhost hand arg} {
	upvar #0 url_global url
	set slength [string length [lindex $arg 4]]
	if {$slength < 8 || $slength > 8} {
		putserv "NOTICE $nick :Your Location ID must be in the form of 'XXXX0000'.  Please read $url"
		return
	}
	set arg [lindex $arg 4]


	putlog "DEBUG: setting LOCATIONID for $nick: $arg"


  global lastbind quiet-reject LOCATIONID-fields
   set LOCATIONID "LOCATIONID"
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
	set value [getuser $hand XTRA LOCATIONID]
   if {$hand != "*"} {
      if {$arg != ""} {
         if {[string tolower $arg] == "none"} {
            putserv "NOTICE $nick :Removed your Location ID."
            setuser $hand XTRA LOCATIONID ""
         } {
            putserv "NOTICE $nick :Your Location ID is $arg"
            setuser $hand XTRA LOCATIONID "[string range $arg 0 159]"
         }
      } {
         if {$value == ""} {
            putserv "NOTICE $nick :You have no Location ID set."
         } 
	}
   } else {
      if {${quiet-reject} != 1} {
      # adding a user to the dbase if they don't exist... this should go first.
      }
   }
  putcmdlog "($nick!$uhost) !$hand! Location ID $arg"
  return 0
}

# Set LOCATIONID_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the LOCATIONID tcl.

set LOCATIONID_loaded 1

##### GENDER
set gender-fields "gender"

# This script's identification

set genderver "gender TCL v0.1b"

# Make sure we don't bail because whois and/or gender-fields aren't set.

if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists gender-fields]} { set gender-fields "" }

foreach field [string tolower ${gender-fields}] {
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


proc msg_tellgender {nick uhost hand arg} {
	   set gender "GENDER"
	if {[getuser $hand XTRA $gender] == ""} {
            putserv "NOTICE $nick :You have no gender set."
		return
         } {
            putserv "NOTICE $nick :Your gender is [getuser $hand XTRA GENDER]"
		return
         }
}

# This is the `/msg <info>' procedure
proc msg_setgender {nick uhost hand arg} {
	if {[lindex $arg 3] != "M" && [lindex $arg 3] != "F" && [lindex $arg 3] != "A"} {
	putserv "NOTICE $nick :Your gender must be set to one of the following: (M)ale, (F)emale or (A)sexual.  Please try again."
	return
	}
	set arg [lindex $arg 3]


	putlog "DEBUG: setting GENDER for $nick: $arg"


  global lastbind quiet-reject gender-fields
   set gender "GENDER"
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
            putserv "NOTICE $nick :Removed your $gender line."
            setuser $hand XTRA $gender ""
         } {
            putserv "NOTICE $nick :Your gender is $arg"
            setuser $hand XTRA $gender "[string range $arg 0 159]"
         }
      } {
         if {[getuser $hand XTRA $gender] == ""} {
            putserv "NOTICE $nick :You have no $gender set."
         } {
            putserv "NOTICE $nick :Your gender is [getuser $hand XTRA gender]"
         }
      }
   } else {
      if {${quiet-reject} != 1} {
      # adding a user to the dbase if they don't exist... this should go first.
      }
   }
  putcmdlog "($nick!$uhost) !$hand! $gender $arg"
  return 0
}

# Set gender_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the gender tcl.

set gender_loaded 1

##### HELLO
set hello-fields "hello"

# This script's identification

set hellover "hello TCL v0.1b"

# Make sure we don't bail because whois and/or hello-fields aren't set.

if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists hello-fields]} { set hello-fields "" }

foreach field [string tolower ${hello-fields}] {
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


proc msg_tellhello {nick uhost hand arg} {
	   set hello "hello"
	if {[getuser $hand XTRA $hello] == ""} {
            putserv "NOTICE $nick :You have no hello set."
		return
         } {
            putserv "NOTICE $nick :Your hello is [getuser $hand XTRA hello]"
		return
         }
}

# This is the `/msg <info>' procedure
proc msg_sethello {nick uhost hand arg} {
	set hello_status_request [string toupper [lindex $arg 3]]
	putlog "DEBUG: hello_status_request = $hello_status_request"
	if {$hello_status_request != "OFF" && $hello_status_request != "ON"} {
	putserv "NOTICE $nick :Your hello must be set to one of the following: 'OFF' or 'ON'.  Please try again."
	return
	}
	set arg $hello_status_request


	putlog "DEBUG: setting hello for $nick: $arg"


  global lastbind quiet-reject hello-fields
   set hello "hello"
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
            putserv "NOTICE $nick :Removed your $hello line."
            setuser $hand XTRA $hello ""
         } {
            putserv "NOTICE $nick :Your hello is $arg"
            setuser $hand XTRA $hello "[string range $arg 0 159]"
         }
      } {
         if {[getuser $hand XTRA $hello] == ""} {
            putserv "NOTICE $nick :You have no $hello set."
         } {
            putserv "NOTICE $nick :Your hello is [getuser $hand XTRA hello]"
         }
      }
   } else {
      if {${quiet-reject} != 1} {
      # adding a user to the dbase if they don't exist... this should go first.
      }
   }
  putcmdlog "($nick!$uhost) !$hand! $hello $arg"
  return 0
}
# Set hello_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the hello tcl.

set hello_loaded 1

##### GREETING
set greeting-fields "\*MY~greeting~IS\*"

# This script's identification

set greetingver "greeting v0.1a"

# This script is NOT for pre-1.4.3 versions.

catch { set numversion }
if {![info exists numversion] || ($numversion < 1040300)} {
  putlog "*** Can't load $greetingver -- At least Eggdrop v1.4.3 required"
    return 0
}

# Make sure we don't bail because whois and/or greeting-fields aren't set.

if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists greeting-fields]} { set greeting-fields "" }

foreach field [string tolower ${greeting-fields}] {
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




proc msg_tellgreeting {nick uhost hand arg} {
	   set greeting "greeting"
	if {[getuser $hand XTRA $greeting] == ""} {
            putserv "NOTICE $nick :You have no greeting set."
		return
         } {
            putserv "NOTICE $nick :Your greeting is [getuser $hand XTRA greeting]"
		return
         }
}

# This is the `/msg <info>' procedure
proc msg_setgreeting {nick uhost hand arg} {

	set temp ""
	set counter 3
	while {$counter < [llength $arg]} {
		lappend temp [lindex $arg $counter]
		incr counter
		}
	set arg $temp


	putlog "DEBUG: setting greeting for $nick: $arg"
  global lastbind quiet-reject greeting-fields
   set greeting "greeting"
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
            putserv "NOTICE $nick :Removed your greeting line."
            setuser $hand XTRA $greeting ""
         } {
            putserv "NOTICE $nick :Your greeting is $temp"
	    putlog "DEBUG: [string range $temp 0 159]"
            setuser $hand XTRA $greeting "[string range $temp 0 159]"
         }
      } {
         if {[getuser $hand XTRA $greeting] == ""} {
            putserv "NOTICE $nick :You have no greeting set."
         } {
            putserv "NOTICE $nick :Your greeting is [getuser $hand XTRA greeting]"
         }
      }
   } else {
      if {${quiet-reject} != 1} {
      # adding a user to the dbase if they don't exist... this should go first.
      }
   }
  putcmdlog "($nick!$uhost) !$hand! $greeting $temp"
  return 0
}
# Set greeting_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the greeting tcl.

set greeting_loaded 1

#####TAGLINE
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

##### USUAL
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
	if {[lindex $arg 2] == "me" && [lindex $arg 2] == "my" && [getuser [nick2hand $nick $chan] XTRA USUAL] == ""} {puthelp "PRIVMSG $nick :Please see http://lmudc.net/mike/help.html to set your usual";return}

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
		putserv "PRIVMSG $chan :\001ACTION serves $patron_local $nick's usual.\001"
		return
	}
	if {[getuser $hand XTRA USUAL] != ""} {
		putlog "DEBUG: serve_usual_self_to_other Gave USUAL to $patron_local"
		putserv "PRIVMSG $chan :\001ACTION serves $patron_local [getuser $hand XTRA USUAL], courtesy of $nick.\001"
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

set ZIPCODE-fields "ZIPCODE"

# This script's identification

set ZIPCODEver "ZIPCODE TCL v0.1b build 005"

# This script is NOT for pre-1.4.3 versions.

catch { set numversion }
if {![info exists numversion] || ($numversion < 1040300)} {
  putlog "*** Can't load $ZIPCODEver -- At least Eggdrop v1.4.3 required"
    return 0
}

# Make sure we don't bail because whois and/or ZIPCODE-fields aren't set.

if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists ZIPCODE-fields]} { set ZIPCODE-fields "" }

foreach field [string tolower ${ZIPCODE-fields}] {
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



proc msg_tellZIPCODE {nick uhost hand arg} {
	upvar #0 url_global url
	   set ZIPCODE "ZIPCODE"
		
	set value [getuser $hand XTRA ZIPCODE]
	putlog "DEBUG A $value"
	if {$value == ""} {
            putserv "NOTICE $nick :You have no zip code set.  If you are not in the US, use '00000', and set your city-state/country data for some functions to work."
		return
         } {
		if {$value == "00000"} {
            	putserv "NOTICE $nick :You are in a non-US area.  See $url if you need to change this."
		return
		}
	putserv "NOTICE $nick :Your zip code is $value."
		return
		}
         }


# This is the `/msg <info>' procedure
proc msg_setZIPCODE {nick uhost hand arg} {
	upvar #0 url_global url
	set temp ""
	set counter 4
	set temp [lindex $arg 4]
	if {$temp < 0 || $temp > 99999} {
		putserv "NOTICE $nick :Your zip code must be between 00000 and 99999"
		return
	}
	set arg $temp


	putlog "DEBUG: setting ZIPCODE for $nick: $arg"


  global lastbind quiet-reject ZIPCODE-fields
   set ZIPCODE "ZIPCODE"
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
	set value [getuser $hand XTRA ZIPCODE]
   if {$hand != "*"} {
      if {$arg != ""} {
         if {[string tolower $arg] == "none"} {
            putserv "NOTICE $nick :Removed your zip code."
            setuser $hand XTRA ZIPCODE ""
         } {
            putserv "NOTICE $nick :Your zip code is $arg"
            setuser $hand XTRA ZIPCODE "[string range $arg 0 159]"
         }
      } {
         if {$value == ""} {
            putserv "NOTICE $nick :You have no zip code set."
         } 
	}
   } else {
      if {${quiet-reject} != 1} {
      # adding a user to the dbase if they don't exist... this should go first.
      }
   }
  putcmdlog "($nick!$uhost) !$hand! zip code $arg"
  return 0
}

# Set ZIPCODE_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the ZIPCODE tcl.

set ZIPCODE_loaded 1







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
