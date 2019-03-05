Hi, welcome to my GitHub
No promises on how frequently I'll actually update this but here's the basics of why it's here:

My career is in automation testing and so I am currently trying to learn new ways of doing automation testing (particularly windows testing).
But I also do video editing as a hobby so I am always tinkering in my spare time to create faster shortcuts to accomplish tasks faster.

This Particular repository is for scripts and other utilities I use for Adobe Premiere Pro CC.
I currently use AutoHotKey for keyboard shortcuts and the idea and select function names were lifted from Taran Hemert.

Before settling down on AutoHotKey I did try my hand at both PyWin and AutoIT
-PyWin is primarily a testing tool and therefore doesn't do much good for the purpose of "on the spot" shortcuts for video editing,
and also requires an IDE such as Eclipse to maintain and execute code so it's not an ideal solution.
-AutoIT is VERY similar to AutoHotKey as they both use a similar WindowSpy utility (in fact AutoIT's built in window spy actually offers more options)
However AutoIT is functionally more difficult to work with and takes much more code to accomplish what AutoHotKey can with much less code.
AutoIT scripts also can't be set to always run without a VERY long sleep function which eats up CPU usage and generally isn't good code.
And as this pertains to Video Editing shortcuts AutoIT also doesn't play nicely with assigning HotKeys. Each HotKey must be assigned with a function
which must be written out outside the HotKey. Compared to AutoHotKey only requiring either the key you wish to use and either the function
or key assignment you wish to change that key to.
(It is very much possible to assign HotKeys in AutoHotKey to execute AutoIT scripts but in this scenario It's much simpler and more sensible
to simply use AutoHotKey for everything.)

-(I have not tried Winium or other Windows tools for video editing purposes but I would expect to run into the same bottlenecks and so AutoHotKey
simply serves as a better utility.)
