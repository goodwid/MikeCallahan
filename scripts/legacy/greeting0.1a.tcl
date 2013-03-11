# greeting.tcl v1.0 for Eggdrop 1.4.3 and higher
#	Flaim	flaim@flaim.net
#
#
# TO USE:  o    Set the desired greeting field keywords to the
#               `greeting-fields' line below where indicated.
#          o    Load this script on a 1.1.6 or later Eggdrop bot.
#          o    Begin having users save the desired information.  If you
#               choose to add the default "IRL" field, they just use
#               the IRC command: /MSG <botnick> my greeting is <greeting>
#          o    See the new information now appear with the whois command.
#
# This script enhances the `whois' output utilizing the `whois-fields'
# option of eggdrop 1.1-grant and later versions.  It adds the functionality
# of whois.tcl used in pre-1.1-grant versions.
#
# The fields desired to be maintained in the userfile `xtra' information
# should be put in `greeting-fields'.  This is different than the Eggdrop
# configuration variable `whois-fields' in that this script will add the
# commands to change these fields.   It will also add these desired fields
# to the `whois-fields' itself, so do not define them there as well.  The
# fields added in `greeting-fields' will be converted to upper case for
# aesthetics in the `whois' command output.
#
# The commands that will be added to the running eggdrop are:
#  (<info> will be the respective userfile field added in `greeting-fields')
#
#   TYPE    COMMAND         USAGE
#   ======  ==============  ========================================
#   msg     my greeting is     To change your <info> via /MSG.
#   dcc     .greeting          To change your <info> via DCC.
#   dcc     .chgreeting        To change someone else's <info> via DCC.
#

################################
# Set your desired fields here #
################################

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


# Set greeting_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the greeting tcl.

set greeting_loaded 1

# Announce that we've loaded the script.

putlog "$greetingver loaded (${greeting-fields})."