Overview
========
While working on personal projects I found myself constantly doing the same steps over and over again whenever I would create a new project. So I decided to jump into unknown world that is "Xcode 4 Project Template documentation" and figure out how to create my own project template.

Most of what I learned was by looking at Apple's own templates (which are located in /Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates/ and /Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/) but one person in particular really helped me out.

Meer days after Xcode 4 was released [@borealkiss](http://twitter.com/borealkiss) made [this great blog post](http://blog.boreal-kiss.net/2011/03/11/a-minimal-project-template-for-xcode-4/) about their discoveries about Xcode 4's project templating system. If you are interested learning about Xcode 4's project templates you should definitely read that blog post and check out borealkiss' [templates](https://github.com/borealkiss/Minimal-Template).

Installation
============
Run install.sh with the name of the folder you would like the templates to be copied to. If you don't provide a name it will default to "1414 Degrees".

Known Bugs
==========
There is one known bug with these templates. TestFlight v1.1 requires libz.dylib. I have not found a way to add libz.dylib to the project throught the Xcode project templating system so you must manually add libz.dylib to the "Link Binary With Libraries" section of "Build Phases" for all targets that use TestFlight.

Planned Enhancements
====================
I've always wanted to experiment with a Mac app. I plan add a Mac project template that will contain similar nomenclature and layout to the iOS project template.
