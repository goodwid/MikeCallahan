##########################################################
# Script: Auto identify           # You are free to edit #
# Version: 1.0.0                  # this script as much  #
# Author: Alien                   # as you want as long  #
# Email:  alien@irctools.org      # as you keep my name  #
# Web:    www.weaklink.ws/~alien/ # in credits.          #
##########################################################
# This script will automatically  # Feel free to email   #
# identify your bot's nick to     # me with suggestions  #
# nickserv. It works on all       # or bugs.             #
# services versions with classic  #                      #
# command for identifying         #                      #
##########################################################

###
# Configuration starts here
###

#
# Bot's nickname password

set ident_pass "Hirta001jct"

#
# Nickname of nick identifying service
# In most cases it is NickServ

set ident_service "NickServ"

#
# Command for identifying:
# 0 - /msg NickServ IDENTIFY password
# 1 - /msg NickServ IDENTIFY nick password

set ident_cmd "0"

#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#
#                 Configuration ends here                 #
# You shouldn't edit anything below unless you know how.  #
#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#

# The mighty bind

bind notc - "*nickname is registered*" ident_id

# Now the proc

proc ident_id { nick host hand chan smt } {
global botnick ident_pass ident_service ident_cmd

if {$nick == $ident_service} {
   if {$ident_cmd == "0"} {
        puthelp "PRIVMSG $ident_service :IDENTIFY $ident_pass"
        putlog "ALI: Identifying to $ident_service as requested."
   }
   if {$ident_cmd == "1"} {
        puthelp "PRIVMSG $ident_service :IDENTIFY $botnick $ident_pass"
        putlog "ALI: Identifying to $ident_service as requested."
   }
}
}

# All done

putlog "ALI: Loaded Auto Identify TCL by Alien"