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

# Delete the install directory if it already exists to prevent deleted files from lingering.
if [ -d "$installDirectory" ]
then
	rm -r "$installDirectory"
fi

# Create the install directory.
mkdir -p "$installDirectory"

# Copy all of the xctemplate folders into the install directory.
cp -r *.xctemplate "$installDirectory"

# Create empty directories that the project templates will copy.
mkdir -p "$installDirectory"/"Base.xctemplate/Supporting Files/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/iPad/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/iPhone/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Shared/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Vendors/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Common/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Classes/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Controllers/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Categories/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Controls/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Views/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Resources/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Managers/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/Services/"
mkdir -p "$installDirectory"/"iOS Application.xctemplate/TestFlight/"
