#!/usr/bin/env bash

# Default the folder name to "1414 Degrees".
folderName="1414 Degrees"

# Ensure that at most one argument has been passed in.
if [ "$#" -eq 1 ]
then
	folderName=$1
elif [ "$#" -gt 1 ]
then
	echo -e "This script takes one argument at most.\\ne.g. install.sh \"1414 Degrees\""
	exit 1
fi

# Determine the install directory.
installDirectory=~/Library/Developer/Xcode/Templates/Project\ Templates/"$folderName"

echo "Templates will be installed to $installDirectory"

# Create the install directory if it does not exist.
if [ ! -d "$installDirectory" ]
then
	mkdir "$installDirectory"
fi

# Copy all of the xctemplate folders into the install directory.
cp -r *.xctemplate "$installDirectory"

# Create empty directories that the project templates will copy.
mkdir "$installDirectory"/"Base.xctemplate/Supporting Files/"
mkdir "$installDirectory"/"iOS Application.xctemplate/iPad/"
mkdir "$installDirectory"/"iOS Application.xctemplate/iPhone/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Shared/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Vendors/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Common/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Classes/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Controllers/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Categories/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Controls/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Views/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Resources/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Images/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Managers/"
mkdir "$installDirectory"/"iOS Application.xctemplate/Services/"
mkdir "$installDirectory"/"iOS Application.xctemplate/TestFlight/"
