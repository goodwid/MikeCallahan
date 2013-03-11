# ZIPCODE.tcl v.1b for Eggdrop 1.4.3 and higher
#	Flaim	flaim@flaim.net
#
#
# TO USE:  o    Set the desired ZIPCODE field keywords to the
#               `ZIPCODE-fields' line below where indicated.
#          o    Load this script on a 1.1.6 or later Eggdrop bot.
#          o    Begin having users save the desired information.  If you
#               choose to add the default "IRL" field, they just use
#               the IRC command: /MSG <botnick> my ZIPCODE is <ZIPCODE>
#          o    See the new information now appear with the whois command.
#
# This script enhances the `whois' output utilizing the `whois-fields'
# option of eggdrop 1.1-grant and later versions.  It adds the functionality
# of whois.tcl used in pre-1.1-grant versions.
#
# The fields desired to be maintained in the userfile `xtra' information
# should be put in `ZIPCODE-fields'.  This is different than the Eggdrop
# configuration variable `whois-fields' in that this script will add the
# commands to change these fields.   It will also add these desired fields
# to the `whois-fields' itself, so do not define them there as well.  The
# fields added in `ZIPCODE-fields' will be converted to upper case for
# aesthetics in the `whois' command output.
#
# The commands that will be added to the running eggdrop are:
#  (<info> will be the respective userfile field added in `ZIPCODE-fields')
#
#   TYPE    COMMAND         USAGE
#   ======  ==============  ========================================
#   msg     my ZIPCODE is     To change your <info> via /MSG.
#

################################
# Set your desired fields here #
################################

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

bind msgm - *my~zip~code~is* msg_setZIPCODE
bind msgm - *what~is~my~zip~code* msg_tellZIPCODE
bind msgm - *what's~my~zip~code* msg_tellZIPCODE

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

# Set ZIPCODE_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the ZIPCODE tcl.

set ZIPCODE_loaded 1

# Announce that we've loaded the script.

putlog "Zippity Do Dah! $ZIPCODEver loaded (${ZIPCODE-fields})."
