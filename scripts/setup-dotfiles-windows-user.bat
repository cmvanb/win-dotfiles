@echo off

:: update git submodules
git submodule update --init

:: make a junction (symbolic hard link directory) for vimfiles/
mklink /J %userprofile%\vimfiles %~dp0..\.vim

:: make a hard link (symbolic hard link file) for .vimrc
mklink /H %userprofile%\.vimrc %~dp0..\.vimrc"