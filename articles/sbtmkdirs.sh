#!/bin/bash

#------------------------------------------------------------------------------
# Name:    sbtmkdirs
# Purpose: Create an SBT project directory structure with a few simple options.
# Author:  Alvin Alexander, http://alvinalexander.com
# Info:    http://alvinalexander.com/sbtmkdirs
# License: Creative Commons Attribution-ShareAlike 2.5 Generic
#          http://creativecommons.org/licenses/by-sa/2.5/
#------------------------------------------------------------------------------
declare -r TRUE=0
declare -r FALSE=1

# takes a string and returns true if it seems to represent "yes"
function isYes() {
  local x=$1
  [ $x = "y" ] && echo $TRUE; return
  [ $x = "Y" ] && echo $TRUE; return
  [ $x = "yes" ] && echo $TRUE; return
echo $FALSE
}

echo "This script creates an SBT project directory beneath the current directory."

while [ $TRUE ]; do

echo ""
  read -p "Directory/Project Name (MyFirstProject): " directoryName
  directoryName=${directoryName:-MyFirstProject}

  read -p "Create .gitignore File? (Y/n): " createGitignore
  createGitignore=${createGitignore:-y}

  read -p "Create README.md File? (Y/n): " createReadme
  createReadme=${createReadme:-y}

  echo ""
  echo "-----------------------------------------------"
  echo "Directory/Project Name: $directoryName"
  echo "Create .gitignore File?: $createGitignore"
  echo "Create README.md File?: $createReadme"
  echo "-----------------------------------------------"
  read -p "Create Project? (Y/n): " createProject
  createProject=${createProject:-y}
  [ "$(isYes $createProject)" = "$TRUE" ] && break

done

mkdir -p ${directoryName}/src/{main,test}/{java,resources,scala}
mkdir ${directoryName}/lib ${directoryName}/project ${directoryName}/target

# optional
#mkdir -p ${directoryName}/src/main/config
#mkdir -p ${directoryName}/src/{main,test}/{filters,assembly}
#mkdir -p ${directoryName}/src/site

#---------------------------------
# create an initial build.sbt file
#---------------------------------
echo "name := \"$directoryName\"

version := \"1.0\"

scalaVersion := \"2.10.1\"" > ${directoryName}/build.sbt

#------------------------------
# create .gitignore, if desired
#------------------------------
if [ "$(isYes $createGitignore)" = "$TRUE" ]; then
echo "bin/
project/
target/
.cache
.classpath
.project
.settings" > ${directoryName}/.gitignore
fi

#-----------------------------
# create README.me, if desired
#-----------------------------
if [ "$(isYes $createReadme)" = "$TRUE" ]; then
touch ${directoryName}/README.md
fi

echo ""
echo "Project created. See the following URL for build.sbt examples:"
echo "http://alvinalexander.com/scala/sbt-syntax-examples"
