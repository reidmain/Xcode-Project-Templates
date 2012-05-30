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
There is one known bug with these templates and unfortunately it is a massive one.

Instead of using the default build configurations of Debug and Release I use three: Debug, Ad Hoc and App Store. I find this beneficial because then I can setup preprocessor macros for Ad Hoc and App Store and easily specify code that is only included in the Ad Hoc or App Store builds. A practical example is the token for Google Analytics. For Debug and Ad Hoc we use one token to test and then another token for App Store so we don't polute the App Store data while we are developing.

However, Xcode still sets the default command line build configuration to be Release. The preventative measure for this problem is go the project info tab and ensure that the "Command-line builds use" field is set to any of the existing build configurations. If you fail to do this and close and reopen the project you will receive the following error message "Example Project.xcodeproj cannot be opened: The project contains has no default build configuration - it may have been damaged" and Xcode will fail to open the project. Fortunately the solution to this is simple. Open the project.pbxproj file and search for "defaultConfigurationName" and you should see "defaultConfigurationName = Release;". The solution is to either delete this line or change Release to one of the valid build configurations. If you are going to change to Ad Hoc or App Store be sure you use quotes or else Xcode will fail to parse it.

If someone knows how to set defaultConfigurationName in the Xcode project templating system drop me a line because I'd love to fix this bug.

Planned Enhancements
====================
There are two planned enhancements to these templates:

1) Update them for Automatic Reference Counting. I plan to add a checkbox to the project template that will update all the files for ARC.

2) Mac project template. I've always wanted to experiment with a Mac app. I plan add a Mac project template to this that will container similar nomenclature and layout.
