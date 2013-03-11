# hello.tcl v.1b for Eggdrop 1.4.3 and higher
#	Flaim	flaim@flaim.net
#
#
# TO USE:  o    Set the desired hello field keywords to the
#               `hello-fields' line below where indicated.
#          o    Load this script on a 1.1.6 or later Eggdrop bot.
#          o    Begin having users save the desired information.  If you
#               choose to add the default "IRL" field, they just use
#               the IRC command: /MSG <botnick> my hello is <hello>
#          o    See the new information now appear with the whois command.
#
# This script enhances the `whois' output utilizing the `whois-fields'
# option of eggdrop 1.1-grant and later versions.  It adds the functionality
# of whois.tcl used in pre-1.1-grant versions.
#
# The fields desired to be maintained in the userfile `xtra' information
# should be put in `hello-fields'.  This is different than the Eggdrop
# configuration variable `whois-fields' in that this script will add the
# commands to change these fields.   It will also add these desired fields
# to the `whois-fields' itself, so do not define them there as well.  The
# fields added in `hello-fields' will be converted to upper case for
# aesthetics in the `whois' command output.
#
# The commands that will be added to the running eggdrop are:
#  (<info> will be the respective userfile field added in `hello-fields')
#
#   TYPE    COMMAND         USAGE
#   ======  ==============  ========================================
#   msg     my hello is     To change your <info> via /MSG.
#   dcc     .hello          To change your <info> via DCC.
#   dcc     .chhello        To change someone else's <info> via DCC.
#

################################
# Set your desired fields here #
################################

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
bind msgm - *my~hello~is* msg_sethello
bind msgm - *what~is~my~hello* msg_tellhello
bind msgm - *what's~my~hello* msg_tellhello

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
# Set hello_loaded variable to indicate that the script was successfully
# loaded. this can be used in scripts that make use of the hello tcl.

set hello_loaded 1

# Announce that we've loaded the script.

putlog "$hellover loaded (${hello-fields})."
