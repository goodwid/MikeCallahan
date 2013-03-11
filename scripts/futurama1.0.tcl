# Futurama 1.0
#
# Quotes from our favorite TV show. 
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
bind pubm - *Mike,~futurama pub_futurama

proc pub_futurama {nick mask hand channel args} {
   global fry
   puthelp "PRIVMSG $channel :[lindex $fry [rand [llength $fry]]]"
   }

set fry {

"\"Ugh, it's like there's a party in my mouth and everyone's throwing up.\""
"\"But existing is basically all I do! \""
"\"Whoa! Letters like 'u' and 'r' can mean words like 'you' and 'are'! \""
"\"Magic. Got it \""
"\"Oh. Your. God. \""
"\"Oh wait, you're serious. Let me laugh even harder. \""
"\"I'm Bender, baby, please insert liquor! \""
"\"Congratulations Fry, you've snagged the perfect girlfriend. Amy's rich, she's probably got other characteristics... \""
"\"Do I preach to you while you're lying stoned in the gutter? No. \""
"\"You buy one pound of underwear and you're on their list forever. \""
"\"I'll find Fry's coffin, get his corpse, and keep it under my mattress to remind me that he's really dead. That'll prove I'm not insane! \""
"\"This is Fry's decision. And he made it wrong, so it's time for us to interfere in his life. \""
"\"Choke on that, causality! \""
"\"Sweet Zombie Jesus! \""
"\"Everyone's always in favor of saving Hitler's brain. But when you put it in the body of a great white shark, ooohh! Suddenly you've gone too far! \""
"\"Oh, my, yes. \""
"\"Friends! Help! A guinea pig tricked me! \""
"\"I don't trust that doctor. I bet I've lost more patients than he's even treated. \""
"\"Wow, sporty go-kart, Leela! It's so hip and sexy, not like you at all. \""
"\"Hey, let's go car shopping! My parents said if I got all B's they'd buy me a bar. And I got all C's! \""
"\"I'm calling the police! ...Right after I flush some tings. \""
"\" The best way into a girl's bed is through her parents. Have sex with them, and you're in.\""
"\"You win again, gravity! \""
"\"Kittens give Morbo gas. \""
"\" All My Circuits is brought to you by Robofresh. Designed by a robot for a robot. \""
"\"Female Robot: It fits, then you must know that I'm...
Calculon: Metric? I've always known, but for you my darling, I'm willing to convert. \""
"\" Look at that 5 o'clock rust. You've been up all night not drinking, haven't you. \""
"\"OK, but I don't want anyone thinking we're robosexuals \""
"\"Well I don't have anything else planned for today, let's get drunk! \""
"\"Yeah, well I'm gonna build my own lunar space lander! With blackjack aaaaannd Hookers! Actually, forget the space lander, and the blackjack. Ahhhh forget the whole thing! \""
"\"That's the saltiest thing I ever tasted, and I once ate a big heaping bowl of salt. \""
"\" Fry, of all the friends I've had... you're the first. \""
"\" That concludes the portion of the tour where you stay alive. \""
"\"Leela: No, there's already a soda like that -- Soylent Cola. Fry: Oh. How is it? Leela: It varies from person to person. \""
"\" This is nothing. In high school, I used to drink a hundred cans of Cola a week, right up to my third heart attack \""
"\"But as a gentleman, I must warn you, if you so much as glance at another woman, I'll be on Leela like a fly on a pile of very seductive manure.\""
"\"Thank God there were plenty of escape pods. We won't have to dress up like women and children. \""
"\" They planted traditional college foliage: ivy, trees, hemp... \""
"\"What? After I spent MONTHS slaving over a hot monkey brain? \""
"\"Yes. Which is why we'll market it as 'New Slurm'. Then when everyone hates it, we'll bring back 'Slurm Classic,' and make billions. \""
"\"Leela: I'm a virgin. Mutant: Nice try, Leela, but we've all seen Zapp Branagin's web page. \""
"\" Every Christmas my Mom would get a fresh goose, for gooseburgers, and my Dad would whip up his special eggnog out of bourbon and ice cubes. \""
"\"Fry: I'm not a one-woman man. Leela: I'm sure you'll be back to zero soon enough. \""
"\"Ooh. 'Big Pink.' It's the only gum with the breath-freshening power of ham. \""
"\"Captain Zapp Brannigan: I suffer from a very sexy learning disability. What do I call it, Kif? Kif Kroker: [groaning] Sexslexia. \""
"\"Eternity with nerds. It's the Pasadena Star Trek convention all over again. \""
"\" Hey. What kind of party is this? There's no booze and only one hooker. \""
"\"You are now dead. Thank you for using Stop and Drop, America's favorite Suicide Booth since 2008. \""
"\"Wipe out all thought? My God, they're like flying televisions. \""
"\" Shut up friends. My internet browser heard us saying the word Fry and it found a movie about Philip J. Fry for us. It also opened my calendar to Friday and ordered me some french fries. \""
"\"Bender: I was God once. God: Yes, I saw. You were doing well until everyone died. \""
"\"Oh, Dear, I should have shown him 'Electrogonorrhea: the noisy killer' instead. \""

}

putlog "Oh! Your! God!"
