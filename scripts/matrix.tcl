# matrix.tcl v1
#
# Quotes from the Matrix movies
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
#
# Point this to where your data file lives:

putlog "Welcome to the real world.  Matrix v1 loaded successfully."

bind pubm - *Mike,~matrix* pub_matrix


proc pub_matrix {nick mask hand chan arg} {
        set file "./scripts/matrix.egt"

        set temp_file [open $file "r"]
        set matrix [split [read -nonewline $temp_file] "\n"]
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	foreach line [split [lindex $matrix [rand [llength $matrix]]] @@] { putquick "PRIVMSG $chan :$line" }
}
