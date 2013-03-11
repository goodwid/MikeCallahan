# Movie Quotes 1.1 by JimG
# November 11, 2001
#
# This script is a convertion of Dubya.tcl.
# All credits for the actual programming of the script goes to that scripts programmer. http://www.unknown.nu/eggdrop/
# Timer is from EBI.Timer.v1.0.8 by EBI2k.
#
# The quotes listed in this file were compiled, by JimG, from various movie quote web sites.
# New/more movie quotes will be added when time permits.
# Get the latest MovieQuote.tcl at - http://www.phucku.net/~jimg/JimG/MovieQuote/ 
#
# Have movie quotes you'd like to see added? Send them via e-mail to <jimg.will@phucku.net>.
# ( Please include the movie's title, then list the quotes )
# Quotes sent in via e-mail will only be added after their validity has been confirmed and only if time permits.
# ( There is no guarantee quotes will be added )
#
# Movies with quotes in this release: ver 1.1
# 11 movies with 184 quotes.
# 
# Billy Madison, 8
# Blazing Saddles, 18
# The Blues Brothers, 13
# Full Metal Jacket, 25
# Get Shorty, 11
# Goodfellas, 8
# Happy Gilmore, 6
# Pulp Fiction, 22
# Reservoir Dogs, 15
# Scarface, 38
# Scream, 20
#
# Main trigger is !movies or !movie, that will list all the triggers for the individual movies.
#
# Timer settings are at end of file. Go to the bottom of page to set. ( Timer off by default. )
#
# For colored text
# To make a text bold: \002TEXT-BOLD\002
# To make a text with colors: \00304TEXT-RED\003 (04 = red, e.g.)
# To make a text with colors and bold: \002\00304TEXT-RED-BOLD\003\002
#
# Happy Quoting  / JimG
#
### Movie Quote ###
bind pubm - *Mike,~movie* pub_movie
bind pubm - *Mike,~billy pub_billy
bind pubm - *Mike,~blazing pub_blazing
bind pubm - *Mike,~blues pub_blues
bind pubm - *Mike,~dogs pub_dogs
bind pubm - *Mike,~full pub_full
bind pubm - *Mike,~good pub_good
bind pubm - *Mike,~shorty pub_shorty
bind pubm - *Mike,~happy pub_happy
bind pubm - *Mike,~pulp pub_pulp
bind pubm - *Mike,~scarface pub_scarface
bind pubm - *Mike,~scream pub_scream

proc pub_movie {nick mask hand channel args} {
   global movie
   puthelp "PRIVMSG $channel :[lindex $movie [rand [llength $movie]]]"
   }
set movie {
"\"\002Movie Quote Triggers:\002 \00304Billy\003 Madison, \00304Blazing\003 Saddles, \00304Blues\003 Brothers, Get \00304shorty\003\, \00304Full\003 Metal Jacket, \00304Good\003fellas, \00304Happy\003 Gilmore, \00304Pulp\003 Fiction, Reservoir \00304Dogs\003, \00304Scarface\003, \00304Scream\003\""
}

proc pub_billy {nick mask hand channel args} {
   global billy
   puthelp "PRIVMSG $channel :[lindex $billy [rand [llength $billy]]]"
   }
set billy {
"\"Billy: I feel like an idiot. But I am an idiot, so it kinda works out.\""
"\"Frank: When I graduated from first grade, all my dad did was tell me to get a job.\""
"\"Billy: He's gonna shit when he realizes it's shit.\""
"\"Billy: He called the shit poop!\""
"\"Veronica Vaughn: No milk will ever be our milk.\""
"\"Billy Madison: Shampoo is better! I go on first and clean the hair! Conditioner is better! I make the hair silky and smooth!\""
"\"Clown: Hey, kids, it's me! I bet you thought that I was dead! But when I fell over I just broke my leg and got a hemmorage in my head! HA HA HA!!!\""
"\"Billy Madison: WHERE'S MY SNACK PACK?!?! Juanita: You got a banana, you don't need no snack pack.\""
}

proc pub_blazing {nick mask hand channel args} {
   global blazing
   puthelp "PRIVMSG $channel :[lindex $blazing [rand [llength $blazing]]]"
   }
set blazing {
"\"Excuse me, while I whip this out.\"" 
"\"Fifteen's my limit on schinittsengruben\"" 
"\"Where all the white women at?\"" 
"\"C'mon boys. The way you're lollygaggering around here with them shovels you's think it was 120 degrees. Couldn't be more than 114.\"" 
"\"What in the wide, wide world of sports is going on here? I hired you to get some track laid, not to jump around like a bunch of Kansas City faggots\"" 
"\"Be still, Taggart. My mind is aglow with whirling transient nodes of thought careening through a cosmic vapor of intervention.\"" 
"\"Hol'on, Consarnit, golly-darnit. I'll be a horn-swaggeled bushwackin' side-windin' saddled horn... rivvid, ravvid, ravvid.\"" 
"\"Gentlemen, please rest your sphincters\"" 
"\"Be still! Me mind is a raging torrent flooded with rivulets of thought cascading in a waterfall of creative alternatives.\"" 
"\"Please, you're making a German spectacle of yourself\"" 
"\"I pledge allegiance to Hedley Lamarr, and to the evil for which he stands. One scoundrel indisputable with hatred and malice for all. Now mount up and go do that voodoo that you do so well.\"" 
"\"He died like he lived. Sideways.\"" 
"\"My name is Jim, but most people call me... Jim.\"" 
"\"You will be risking your lives, whilst I will be risking an almost-certain Academy Award nomination for the Best Supporting Actor.\"" 
"\"...and please except from us this laurel and hardy handshake.\"" 
"\"How could he do such wonderful stunts... with such small feet!\"" 
"\"He hit Bunny! Let's get him, girls!\"" 
"\"Dock that chink a day's pay for napping on the job!\"" 
}

proc pub_blues {nick mask hand channel args} {
   global blues
   puthelp "PRIVMSG $channel :[lindex $blues [rand [llength $blues]]]"
   }
set blues {
"\"You want I should wipe the dead bugs off the windshield?\"" 
"\"We got both kinds. Country and Western\"" 
"\"It's 106 miles to Chicago, we've got a full tank of gas, half a pack of cigarettes, it's dark, and we're wearing sunglasses\"" 
"\"Did ya get me any Cheeze Whiz, boy?\"" 
"\"Sell them to me. Sell me your children.\"" 
"\"Our Lady of Blessed Acceleration, don't fail us now!\"" 
"\"It wasn't my fault! Really, it wasn't! An old friend came in out of town! The car ran out of gas! I got a flat tire! I didn't have enough money for cab fare! The tux didn't come back from the cleaners! There was an earthquake! A terrible flood! Locusts! It wasn't my fault I swear to God!!!\"" 
"\"The use of unnecessary violence in the apprehension of the Blues Brothers has been approved\"" 
"\"One Timex digital watch - broken. One unused prophylactic. One soiled...\"" 
"\"How much for the little girl? Your women - how much for the women?\"" 
"\"What was I gonna do? Take away your only hope? Take away the very thing that kept you going in there? I took the liberty of bullshitting you.\"" 
"\"They're not gonna catch us. We're on a mission from God!\"" 
"\"I hate Illinois Nazis!\"" 
}

proc pub_full {nick mask hand channel args} {
   global full
   puthelp "PRIVMSG $channel :[lindex $full [rand [llength $full]]]"
   }
set full {
"\"This is your rifle, you will give it a girl's name, because it is the only pussy you pukes will be getting! There will be no more finger-banging little Miss Mary Jane Rottencrotch through her purty pink panties!\"" 
"\"What we have here, my little yellow sister, is a prime example of Alabama black snake!\"" 
"\"Today you are no longer maggots. Today you are marines. You're part of a brotherhood.\"" 
"\"There is no racial bigotry here. We do not look down on niggers, kikes, wops or greasers. Here, you are all equally worthless.\"" 
"\"Five-foot-nine, I didn't know they stacked shit that high.\"" 
"\"I am... in a world... of shit.\"" 
"\"I guess they'd rather be alive than free. Poor dumb bastards.\"" 
"\"Who said that? Who the fuck said that? Who's the slimy communist shit twinkle-toed cocksucker who just signed his own death warrant?\"" 
"\"Privage Pyle, you are so ugly, you are uglier than a modern art masterpiece.\"" 
"\"It is a hard heart that kills. If your killer instincts are not clean and strong you will hesitate at the moment of truth. You will not kill. You will become dead marines. And then you will be in a world of shit. Because marines are not allowed to die without permission. Do you maggots understand?\"" 
"\"Private Pyle, I'm gonna give you three seconds, exactly three fuckin' seconds to wipe that stupid grin off your face or I will gouge out your eyeballs and skull fuck you!\"" 
"\"Bullshit! It looks to me like the best part of you ran down the crack of your mama's ass and ended up as a brown stain on the mattress.\"" 
"\"What is your malfunction, numbnuts?\"" 
"\"Pyle, you had best unfuck yourself and start shitting me Tiffany cufflinks or I will definitely fuck you up!\"" 
"\"You know there's not a single horse in the entire country of Vietman? There's definitely something wrong with that.\"" 
"\"I think what she's trying to say is that you black boys pack too much meat.\"" 
"\"You write Born to Kill on your helmet and you wear a peace button. What's that supposed to be, some kind of sick joke?!\"" 
"\"I wanted to meet stimulating and interesting people of an ancient culture, and kill them. I wanted to be the first kid on my block to get a confirmed kill.\"" 
"\"If I'm gonna get my balls blown off for a word, my word is poontang.\"" 
"\"A day without blood is like a day without sunshine.\"" 
"\"Anyone who runs is V.C. Anyone who stands still is well-disciplined V.C.\"" 
"\"Hell, I like you, you can come over to my house and fuck my sister.\"" 
"\"Hey, you got girlfriend in Vietnam? Me so horny. Me love you long time.\"" 
"\"This is my rifle. There are many like it, but this one is mine.\"" 
"\"Well I got a joke for you. I'm gonna tear you a new asshole.\"" 
}

proc pub_shorty {nick mask hand channel args} {
   global shorty
   puthelp "PRIVMSG $channel :[lindex $shorty [rand [llength $shorty]]]"
   }
set shorty {
"\"You think we watch any of your movies, Harry? I've seen better film on teeth.\"" 
"\"I'm the guy who's telling you the way it is.\"" 
"\"So let me get this straight. You broke in again to apologize for breaking in yesterday?\"" 
"\"I'll find you, Leo. You leave a trail like a fucking caterpillar.\"" 
"\"Well, aren't you gonna offer me whatever it is you taste like?\"" 
"\"I'll think about it, means nothing in L.A...\"" 
"\"The point is this: When I say jump, you say OK, okay?\"" 
"\"Well, I was scared then, but I'm not scared now. How long do you want me to be scared?\"" 
"\"I'm not going to say anymore than I have to, if that.\"" 
"\"I once asked this literary agent what writing paid the best, and he said, ransom notes.\"" 
"\"This guy's got a pink toilet!\"" 
}

proc pub_good {nick mask hand channel args} {
   global good
   puthelp "PRIVMSG $channel :[lindex $good [rand [llength $good]]]"
   }
set good {
"\"The way I see it, everyone takes a beating sometime.\"" 
"\"Go get your shinebox!\"" 
"\"As far back as I can remember I always wanted to be a gangster.\""
"\"You still here? I thought i told you to go fuck your mother.\"" 
"\"I'm funny how? I mean funny like I'm a clown, I amuse you?...Funny how? How am I funny?\"" 
"\"When I heard all the noise, I knew they were cops. Only cops talk that way. If it had been a wiseguy, I wouldn't have heard a thing, I would have been dead.\"" 
"\"If another letter from school goes to that kid's house, in the fuckin oven you're goin, head first.\"" 
"\"You might not know who we are, but we know who you are. Understand?\"" 
}

proc pub_happy {nick mask hand channel args} {
   global happy
   puthelp "PRIVMSG $channel :[lindex $happy [rand [llength $happy]]]"
   }
set happy {
"\"Happy: During high school, I played junior hockey and still hold two league records: most time spent in the penalty box; and I was the only guy to ever take off his skate and try to stab somebody.\""
"\"Happy: You know my girlfriend is dead. She fell off a cliff and died on impact.\""
"\"Happy Gilmore to Bob Barker: The price is wrong, bitch!\""
"\"Happy Gilmore: If I saw myself dressed like that, I'd have to kick my own ass.\""
"\"Happy Gilmore: I was on this tour for one reason - money - but now I've got a new reason: kicking your ass!\""
"\"Shooter McGavern: I eat pieces of shit like you for breakfast. Happy Gilmore: You eat pieces of shit for breakfast?!\""
}

proc pub_pulp {nick mask hand channel args} {
   global pulp
   puthelp "PRIVMSG $channel :[lindex $pulp [rand [llength $pulp]]]"
   }
set pulp {
"\"Oh, man, I shot Marvin in the face.\"" 
"\"Say what again. Say what again. I dare you. I double dare you mother fucka. Say what one more goddamn time.\"" 
"\"And another thing, Butch. Nobody knows about this but you and me and Mr. soon-to-be-living-the-rest-of-his-short-assed-life-in-agonizing-pain-rapist here.\"" 
"\"Oh, I'm sorry. Did I break your concentration?\"" 
"\"No, you won't laugh 'cause it's not funny.\"" 
"\"Bring out the gimp.\"" 
"\"Down stairs they had a garden in glass, like a greenhouse and shit? Nigga fell THROUGH that.\"" 
"\"Oh? Oh, you could blow? Well, I'm a mushroom-cloud laying muthafucka, muthafucka!\"" 
"\"Marvin, why didn't you tell us there was somebody in the bathroom with a fuckin' handcannon? You seen the size of that gun, man? It was bigger than himself!\""
"\"What? What ain't no country I've ever heard of. They speak English in What?\"" 
"\"Now that's a hard fuckin' fact of life. But that's a fact of life yo ass is going to have to get realistic about.\""
"\"You hear me talking, hillbilly boy? I ain't through with you by a damn sight, I'm gonna get medieval on your ass.\""
"\"You stay gone, or you be gone.\"" 
"\"Gentlemen, I have a vision. Your future. A cab ride.\""
"\"Man, touching a wife's feet and sticking your tongue in the hole of the holiest isn't the same ballgame. It isn't even the same leaugue. It isn't even the same sport.\"" 
"\"And when you heard it, that meant yo ass.\""
"\"When the negga goes to indo-china, I want somebody hiding in his bowl of rice to blow a cap in his ass.\"" 
"\"It's not a bike, it's a chopper.\"" 
"\"Zed's dead, baby. Zed's dead.\""  
"\"That's a little more information than i needed...\""  
"\"Man a sewer rat could taste like pumpkin pie, but I'd never because I'd never eat the filthy mother fucka.\""
"\"It's the one that says: Bad Mother Fucka, that my Bad Mother Fucka.\""
}

proc pub_dogs {nick mask hand channel args} {
   global dogs
   puthelp "PRIVMSG $channel :[lindex $dogs [rand [llength $dogs]]]"
   }
set dogs {
"\"We got places all over the place.\"" 
"\"You don't need proof when you have instinct.\"" 
"\"I'm hungry. Let's get a taco.\"" 
"\"I don't give a good fuck what you know or don't know, I'm going to torture you anyway. Not to get information, because it's amusing to me to torture a cop. You can say anything you want 'cause I've heard it all before.\"" 
"\"All right ramblers, let's get rambling!\"" 
"\"If you get a customer, or an employee, who thinks he's Charles Bronson, take the butt of your gun and smash their nose in.\"" 
"\"Mr. Brown? That sounds too much like Mr. Shit.\"" 
"\"Somebody's shoved a red-hot poker up our ass, and I want to know whose name is on the handle!\"" 
"\"If you're talking like a bitch, I'm gonna slap you like a bitch!\"" 
"\"Are you gonna bark all day, little doggy, or are you gonna bite?\"" 
"\"Gee, that was really exciting. I bet you're a big Lee Marvin fan, aren't you?\"" 
"\"You shoot me in a dream, you'd better wake up and apologize.\""
"\"All you can do is pray for a quick death, which you aren't going to get.\"" 
"\"If they hadn't had done, what I told 'em not to do, they'd still be alive.\"" 
"\"Nothing special? What did she have to do? Take you in the back and suck your dick?\"" 
}

proc pub_scarface {nick mask hand channel args} {
   global scarface
   puthelp "PRIVMSG $channel :[lindex $scarface [rand [llength $scarface]]]"
   }
set scarface {
"\"Why don't you try stickin' jou head up jour ass -- see if it fits.\""
"\"So you wanna dance, Frank, or do you wanna sit here and have a heart attack?\""
"\"Me dance? Hey, I think I wanna have a heart attack.\""
"\"This is paradise, I'm tellin' ya. This town like a great big pussy jus' waitin' to get fucked.\""
"\"In this country, you gotta make the money first. Then when you get the money, you get the power. Then when you get the power, then you get the woman.\""
"\"I neva fucked anybody over in my life, who didn't have it comin' to 'im, you got that? All I have in this world is my balls, and my word, and I don't break 'em for no one, jou understand?\""
"\"Don't fuck me, Tony. Don't you ever try to fuck me.\""
"\"Fuck Gaspar Gomez, and fuck the fuckin' Diaz brothers! Fuck'em all! I bury those cock-a-roaches!\""
"\"Manolo, shoot dat piece o' chit.\""
"\"You, too, Mel. You fucked up?\""
"\"Maybe you can handle yourself one of them First Class tickets to the resurrection.\""
"\"That prick! Fuckin' WASP whore.\""
"\"Mob guys... Guineas... I don't trust 'em.\""
"\"You know what capitalism is? Gettin' fucked!\""
"\"Can't you stop saying 'fuck' all the time?\""
"\"Money, money, money, money, money; that's all I ever hear in this house.\""
"\"Manny, look at the pelican fly -- come on, pelican!\""
"\"Say goodnight to the bad guy.\""
"\"Well you stupid fuck, look at you now!\""
"\"Ja! How'd jou like that, eh? Jou fuckin' maricon! Ja!\""
"\"I'm Tony Montana! You fuck wit me, you fuckin' wit da best!\""
"\"Don't fuck wit me!\""
"\"Say 'ello to my little friend!\""
"\"I told you a long time ago you little fucking monkey not to fuck me.\""
"\"Jou should see the other guy -- Jou can' recognize him.\""
"\"Amigo, the only thing in this world that gives orders is balls. Balls. You got that?\""
"\"I could eat a horse / Okay, they're gonna cook you a horse.\""
"\"Don't get confused, Tony; I don't fuck around with the help.\""
"\"Son?! I wish I had one! He's a bum. He was a bum then, and he's a bum now!\""
"\"You got good stuff here. Class A chit.\""
"\"Every day above ground is a good day.\""
"\"Every dog has his day, huh, Mel?\""
"\"We fucked up. He got away.\""
"\"Alberto is an expert in the disposal business.\""
"\"I need a guy with steel in his balls, Tony.\""
"\"Don't fuck me, Tony. Don't you ever try to fuck me.\""
"\"Can't you stop saying 'fuck' all the time?\""
"\"You die, motherfucker!\""
"\"Well you stupid fuck, look at you now!\""
}

proc pub_scream {nick mask hand channel args} {
   global scream
   puthelp "PRIVMSG $channel :[lindex $scream [rand [llength $scream]]]"
   }
set scream {
"\"Sid, don't you blame the movies. Movies don't create psychos. Movies just make psychos more creative.\"" 
"\"When do we see Jamie Lee's breasts? I wanna see Jamie Lee's breasts.\""
"\"Look, Kenny, I know you're about fifty pounds overweight, but when I say hurry, please interpret that as MOVE YOUR FAT TUB OF LARD ASS NOW!\""
"\"Sydney, how does it feel to be almost brutally butchered? How does it feel? People have a right to know!\"" 
"\"Billy and his penis don't deserve you.\"" 
"\"If I'm right about this, I could save a man's life. Do you know what that would do for my book sales?\"" 
"\"Who am I? The beer wench?\"" 
"\"If you were the only suspect in a senseless bloodbath-- would you be standing in the horror section?\"" 
"\"It's called subtlety, Stu. You should look it up sometime.\"" 
"\"Now that Billy tried to mutilate her, do you think Sydney would go out with me?\"" 
"\"Oh please don't kill me Mr. Ghostface, I wanna be in the sequel!\"" 
"\"I will totally protect you. Yo, I am so buff, I got you covered, girl.\"" 
"\"I wish I could be in a Meg Ryan movie. Or at least a good porno.\"" 
"\"I never thought I'd be so happy to be a virgin!\"" 
"\"What's the point they're all the same, some stupid killer stalking some big breasted girl who can't act and is always unning up the stairs when she should be running out the front door, it's insulting.\"" 
"\"It's the millennium, motives are incidental.\"" 
"\"There's always some stupid bullshit reason to kill your girlfriend.\"" 
"\"My mom and dad are going to be so mad at me!\"" 
"\"Bam! Bitch went down!!!\"" 
"\"Oh, god, Kenny. I'm sorry, but get off the fucking windshield.\"" 
}

### End Movie Quote Area ###

### Timer Settings ###
# Timer script from - EBI.Timer.v1.0.8 by EBI2k (Thx to John_Doggett)
# Timer is off by default.
#
# Channel - Add the channels, you want the timed message to show in, here.
set channel "#your-chan-here"

# AD-Text 1 - Remove the #, at the begining of set text1 line, to activate the timer.
# You may edit the text, between the " ", in the line below if needed.

#set text1 "For movie quotes type \00304!movies\003 for a list of triggers."

# !!! Do not edit the lines below !!!

bind time - "00 * * * *" text1time 

proc text1time {n h handle ch te} { 
  global text1 channel
  foreach chan $channel { 
  putserv "PRIVMSG $chan :$text1" 
 } 
}
### End Timer Setting Area ###

putlog "\00304MovieQuote1.1 by JimG loaded.\003"
