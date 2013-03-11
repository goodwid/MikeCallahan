# LOCATIONID.tcl v.1b for Eggdrop 1.4.3 and higher
#	Flaim	flaim@flaim.net
#
#
# TO USE:  o    Set the desired LOCATIONID field keywords to the
#               `LOCATIONID-fields' line below where indicated.
#          o    Load this script on a 1.1.6 or later Eggdrop bot.
#          o    Begin having users save the desired information.  If you
#               choose to add the default "IRL" field, they just use
#               the IRC command: /MSG <botnick> my LOCATIONID is <LOCATIONID>
#          o    See the new information now appear with the whois command.
#
# This script enhances the `whois' output utilizing the `whois-fields'
# option of eggdrop 1.1-grant and later versions.  It adds the functionality
# of whois.tcl used in pre-1.1-grant versions.
#
# The fields desired to be maintained in the userfile `xtra' information
# should be put in `LOCATIONID-fields'.  This is different than the Eggdrop
# configuration variable `whois-fields' in that this script will add the
# commands to change these fields.   It will also add these desired fields
# to the `whois-fields' itself, so do not define them there as well.  The
# fields added in `LOCATIONID-fields' will be converted to upper case for
# aesthetics in the `whois' command output.
#
# The commands that will be added to the running eggdrop are:
#  (<info> will be the respective userfile field added in `LOCATIONID-fields')
#
#   TYPE    COMMAND         USAGE
#   ======  ==============  ========================================
#   msg     my LOCATIONID is     To change your <info> via /MSG.
#

################################
# Set your desired fields here #
################################

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

bind msgm - *my~location~id~is* msg_setLOCATIONID
bind msgm - *what~is~my~location~id* msg_tellLOCATIONID
bind msgm - *what's~my~location~id* msg_tellLOCATIONID

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

# Set LOCATIONID_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the LOCATIONID tcl.

set LOCATIONID_loaded 1

# Announce that we've loaded the script.

putlog "NSA GPS Activating . . . $LOCATIONIDver loaded (${LOCATIONID-fields})."
