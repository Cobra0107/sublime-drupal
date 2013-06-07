#!/bin/bash

# Attempt OS detection to set path
os=`uname`;
phpcs=`which phpcs`;

# ST2 Packages directory
if [ $os = 'Linux' ]
then
  st2Dir=~/".config/sublime-text-2/Packages/"
else
  # Assume OSX
  st2Dir=~/"Library/Application Support/Sublime Text 2/Packages/"
fi

# Navigate to Packages DirectoryCKAGE
cd "$st2Dir";

# User Packages Directory
st2UserDir="$st2Dir"User/;

# Default Settings File
st2Settings="$st2UserDir"Preferences.sublime-settings;


# Default Preferences fork for enzo
if [ ! -d "DrupalSublimeConfig" ]; then
 git clone https://github.com/enzolutions/drupal-sublime-config.git DrupalSublimeConfig;
else
  echo "Updating plugin DrupalSublimeConfig";
  cd "DrupalSublimeConfig"
  git pull origin master
  cd ..
fi

# Back up old PHP settings file
if [ -f "$st2UserDir"PHP.sublime-settings ]; then
  echo "Backing up previous version of PHP.sublime-settings...";
  sudo cp -Lf "$st2UserDir"PHP.sublime-settings "$st2UserDir"PHP.sublime-settings.bak;
fi

# Link up new PHP settings file
echo "Linking up settings PHP.sublime-settings..."
ln -fs "$st2Dir"DrupalSublimeConfig/PHP.sublime-settings "$st2UserDir"PHP.sublime-settings;

# Back up old Preferences settings file
if [ -f "$st2UserDir"Preferences.sublime-settings ]; then
  echo "Backing up previous version of Preferences.sublime-settings...";
  sudo cp -Lf "$st2UserDir"Preferences.sublime-settings "$st2UserDir"Preferences.sublime-settings.bak;
fi

# Link up new settings file
echo "Linking up settings Preferences.sublime-settings..."
ln -fs "$st2Dir"DrupalSublimeConfig/Preferences.sublime-settings "$st2Settings";

# Back up old SublimeLinter settings file
if [ -f "$st2UserDir"SublimeLinter.sublime-settings ]; then
  echo "Backing up previous version of SublimeLinter.sublime-settings...";
  sudo cp -Lf "$st2UserDir"SublimeLinter.sublime-settings "$st2UserDir"SublimeLinter.sublime-settings.bak;
fi

# Link up new settings file
echo "Linking up settings SublimeLinter.sublime-settings..."
ln -fs "$st2Dir"DrupalSublimeConfig/SublimeLinter.sublime-settings "$st2UserDir"SublimeLinter.sublime-settings;

# Clone all the plugins!
if [ ! -d "PACKAGE CONTROL" ]; then
  git clone https://github.com/wbond/sublime_package_control.git "Package Control";
else
 echo "Updating plugin Package Control";
 cd "Package Control"
 git pull origin master
 cd ..
fi

# BracketHighlighter
if [ ! -d "BracketHighlighter" ]; then
 git clone https://github.com/facelessuser/BracketHighlighter.git BracketHighlighter;
 else
  echo "Updating plugin BracketHighlighter";
  cd "BracketHighlighter"
  git pull origin master
  cd ..
fi

# DocBlockr
if [ ! -d "DocBlockr" ]; then
 git clone https://github.com/spadgos/sublime-jsdocs.git DocBlockr;
else
  echo "Updating plugin DocBlockr";
  cd "DocBlockr"
  git pull origin master
  cd ..
fi

# LiveCSS
if [ ! -d "LiveCSS" ]; then
 git clone git://github.com/niklas-heer/sublime-css-colors.git LiveCSS;
else
  echo "Updating plugin LiveCSS";
  cd "LiveCSS"
  #support for previous installation the project was moved from https://github.com/a-sk/livecss
  git remote set-url origin git://github.com/niklas-heer/sublime-css-colors.git
  git pull origin master
  cd ..
fi

# GotoDrupalAPI
if [ ! -d "Sublime-Text-2-Goto-Drupal-API" ]; then
 git clone https://github.com/BrianGilbert/Sublime-Text-2-Goto-Drupal-API.git;
else
  echo "Updating plugin Sublime-Text-2-Goto-Drupal-API";
  cd "Sublime-Text-2-Goto-Drupal-API"
  git pull origin master
  cd ..
fi

# Drupal Sublime Snippets
if [ ! -d "DrupalSublimeSnippets" ]; then
 git clone https://github.com/juhasz/drupal_sublime-snippets.git DrupalSublimeSnippets;
else
  echo "Updating plugin DrupalSublimeSnippets";
  cd "DrupalSublimeSnippets"
  git pull origin master
  cd ..
fi

# DrupalCodingStandard Fork
if [ ! -d "DrupalCodingStandard" ]; then
 git clone https://github.com/rypit/DrupalCodingStandard.git DrupalCodingStandard;
else
  echo "Updating plugin DrupalCodingStandard";
  cd "DrupalCodingStandard"
  git pull origin master
  cd ..
fi

#PHP Syntax Checker
#git clone git://github.com/naomichi-y/php_syntax_checker.git 

# Address pathing issues with DrupalCodingStandard's phpcs path
if [ -d /usr/bin/phpcs ]; then
  # Control will enter here if $DIRECTORY exists.
  echo "Setting a symlink to phpcs for DrupalCodingStandard..."
  sudo ln -s "$phpcs" /usr/bin/phpcs
fi

# Goto Documentation
if [ ! -d "sublime-text-2-goto-documentation" ]; then
 git clone https://github.com/kemayo/sublime-text-2-goto-documentation;
else
  echo "Updating plugin sublime-text-2-goto-documentation";
  cd "sublime-text-2-goto-documentation"
  git pull origin master
  cd ..
fi

# Synced SideBar
if [ ! -d "SyncedSideBar" ]; then
 git clone git://github.com/sobstel/SyncedSideBar;
else
  echo "Updating plugin SyncedSideBar";
  cd "SyncedSideBar"
  git pull origin master
  cd ..
fi

# Traling Spaces
if [ ! -d "TrailingSpaces" ]; then
 git clone https://github.com/SublimeText/TrailingSpaces.git;
else
  echo "Updating plugin TrailingSpaces";
  cd "TrailingSpaces"
  git pull origin master
  cd ..
fi

# Drupal AutoComplete
if [ ! -d "st2-drupal-autocomplete" ]; then
 git clone git://github.com/tanc/st2-drupal-autocomplete.git;
else
  echo "Updating plugin st2-drupal-autocomplete";
  cd "st2-drupal-autocomplete"
  git pull origin master
  cd ..
fi

# Git
if [ ! -d "sublime-text-2-git" ]; then
 git clone https://github.com/kemayo/sublime-text-2-git.git;
else
  echo "Updating plugin sublime-text-2-git";
  cd "sublime-text-2-git"
  git pull origin master
  cd ..
fi

#SublimeLinter
if [ ! -d "SublimeLinter" ]; then
 git clone git://github.com/SublimeLinter/SublimeLinter.git
else
  echo "Updating plugin SublimeLinter";
  cd "SublimeLinter"
  git pull origin master
  cd ..
fi

# Soda Theme
if [ ! -d "Theme - Soda" ]; then
 git clone https://github.com/buymeasoda/soda-theme/ "Theme - Soda"
else
  echo "Updating plugin Theme - Soda";
  cd "Theme - Soda"
  git pull origin master
  cd ..
fi

# fetch specific color schemas for soda theme

cd "Theme - Soda"
if [ ! -f "colour-schemes.zip" ]; then
 wget http://buymeasoda.github.com/soda-theme/extras/colour-schemes.zip; 
else
 rm colour-schemes.zip
 wget http://buymeasoda.github.com/soda-theme/extras/colour-schemes.zip   
fi	
yes | unzip colour-schemes.zip

echo "Done";
