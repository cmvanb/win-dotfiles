@echo off

:: update git submodules
git submodule update --init

:: make a junction (symbolic link directory) for vimfiles/
mklink /J %userprofile%\vimfiles %~dp0..\.vim

:: make a symbolic link (symbolic link file) for .vimrc
mklink %userprofile%\.vimrc %~dp0..\.vimrc"

:: make a symbolic link (symbolic link file) for .gvimrc
mklink %userprofile%\.gvimrc %~dp0..\.gvimrc"
