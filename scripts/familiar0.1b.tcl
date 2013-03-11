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

set familiar-fields "familiar"

# This script's identification

set familiarver "familiar TCL v0.1b"

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
bind msgm - *my~familiar~is* msg_setfamiliar
bind msgm - *what~is~my~familiar* msg_tellfamiliar
bind msgm - *what's~my~familiar* msg_tellfamiliar

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
# Set familiar_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the familiar tcl.

set familiar_loaded 1

# Announce that we've loaded the script.

putlog "$familiarver loaded (${familiar-fields})."
