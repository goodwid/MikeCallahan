# booze.tcl v1
#
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "Pashh shome more booze please (4682 drinks loaded)"

bind pubm - *Mike,~booze* pub_booze
global booze_item

proc pub_booze {nick mask hand chan arg} {
        upvar #0 booze_item booze_item_local
        # set this to where your data file lives
        set file "./scripts/booze.egt"

        #reading the data file
        set temp_file [open $file "r"]
        #parsing the data file into a list
        set booze [split [read -nonewline $temp_file] "\n"]
        # file cleanup
        close $temp_file

        putcmdlog "$chan: <$nick> $arg"
        # Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
        foreach line [split [lindex $booze [rand [llength $booze]]] @@] {
        putserv "PRIVMSG $chan :\001ACTION wheels out a mini-bar with supplies for $line.\001"
        putcmdlog "$chan: <$nick> $arg $line"
        set booze_item_local $line
        return
        }
}
##### end pub_booze

