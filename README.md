Overview
========
While working on personal projects I found myself constantly doing the same steps over and over again whenever I would create a new project. So I decided to jump into unknown world that is "Xcode 4 Project Template documentation" and figure out how to create my own project template.

Most of what I learned was by looking at Apple's own templates (which are located in /Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates/ and /Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/) but one person in particular really helped me out.

Meer days after Xcode 4 was released [@borealkiss](http://twitter.com/borealkiss) made [this great blog post](http://blog.boreal-kiss.net/2011/03/11/a-minimal-project-template-for-xcode-4/) about their discoveries about Xcode 4's project templating system. If you are interested learning about Xcode 4's project templates you should definitely read that blog post and check out borealkiss' [templates](https://github.com/borealkiss/Minimal-Template).

Installation
============

0. Make the Library folder visible in Finder with the command "chflags nohidden ~/Library".
1. Create a directory at ~/Library/Developer/Xcode/Templates/Project Templates/. The name of this directory will be what appears under "iOS" in the new project dialog in Xcode.
2. Copy all .xctemplate folders to the folder you created in step 2.
3. Because git does not track empty directories you need to create empty folders in the following locations:
	* Base.xctemplate/Supporting Files/
	* iOS Application.xctemplate/Categories/
	* iOS Application.xctemplate/Classes/
	* iOS Application.xctemplate/Common/
	* iOS Application.xctemplate/Controllers/
	* iOS Application.xctemplate/Controls/
	* iOS Application.xctemplate/Frameworks/
	* iOS Application.xctemplate/Images/
	* iOS Application.xctemplate/iPad/
	* iOS Application.xctemplate/iPhone/
	* iOS Application.xctemplate/Managers/
	* iOS Application.xctemplate/Resources/
	* iOS Application.xctemplate/Services/
	* iOS Application.xctemplate/Shared/
	* iOS Application.xctemplate/TestFlight/
	* iOS Application.xctemplate/Test/

	I know creating all these empty folders is tedious. I am going to look into creating a simple script that will generate them.

Known Bugs
==========
There is one known bug with these templates. TestFlight v1.1 requires libz.dylib. I have not found out how to add libz.dylib to the project throught the Xcode project templating system so you must manually add libz.dylib to the "Link Binary With Libraries" section of "Build Phases" for all targets that use TestFlight.

Planned Enhancements
====================
I've always wanted to experiment with a Mac app. I plan add a Mac project template that will contain similar nomenclature and layout to the iOS project template.
