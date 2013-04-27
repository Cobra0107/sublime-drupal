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

# User Packages Directory
st2UserDir="$st2Dir"User/;

# Default Settings File
st2Settings="$st2UserDir"Preferences.sublime-settings;

# Navigate to Packages Directory
cd "$st2Dir";

# Clone all the plugins!

# Package Control
git clone https://github.com/wbond/sublime_package_control.git "Package Control";

# BracketHighlighter
git clone https://github.com/facelessuser/BracketHighlighter.git BracketHighlighter;

# DocBlockr
git clone https://github.com/spadgos/sublime-jsdocs.git DocBlockr;

# LiveCSS
git clone https://github.com/a-sk/livecss.git LiveCSS;

# GotoDrupalAPI
git clone https://github.com/BrianGilbert/Sublime-Text-2-Goto-Drupal-API.git;

# Drupal Sublime Snippets
git clone https://github.com/juhasz/drupal_sublime-snippets.git DrupalSublimeSnippets;

# DrupalCodingStandard Fork
git clone https://github.com/rypit/DrupalCodingStandard.git DrupalCodingStandard;

# Address pathing issues with DrupalCodingStandard's phpcs path
if [ -d /usr/bin/phpcs ]; then
  # Control will enter here if $DIRECTORY exists.
  echo "Setting a symlink to phpcs for DrupalCodingStandard..."
  sudo ln -s "$phpcs" /usr/bin/phpcs
fi

# Default Preferences fork for enzo
git clone https://github.com/enzolutions/drupal-sublime-config.git DrupalSublimeConfig;

# Goto Documentation
git clone https://github.com/kemayo/sublime-text-2-goto-documentation

# Synced SideBar
git clone git://github.com/sobstel/SyncedSideBar

# Traling Spaces
git clone https://github.com/SublimeText/TrailingSpaces.git

# Drupal AutoComplete
git clone git://github.com/tanc/st2-drupal-autocomplete.git

# Git
git clone https://github.com/kemayo/sublime-text-2-git.git

# Soda Theme
git clone https://github.com/buymeasoda/soda-theme/ "Theme - Soda"

# fetch specific color schemas for soda theme
cd "Theme - Soda"
wget http://buymeasoda.github.com/soda-theme/extras/colour-schemes.zip 
unzip colour-schemes.zip

# Back up old settings file
echo "Backing up previous version of Preferences.sublime-settings..."
sudo cp -Lf "$st2Settings" "$st2Settings".bak

# Link up new settings file
echo "Linking up settings Preferences.sublime-settings..."
ln -fs "$st2Dir"DrupalSublimeConfig/Preferences.sublime-settings "$st2Settings";

echo "Done";
