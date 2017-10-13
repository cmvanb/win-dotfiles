# dotfiles

Configuration files for vim and other software that lives in the user directory.

## Structure

Git submodules are used for external libraries/repositories, these need to be initialized with `git submodule update --init`. Once initialized, all desired dotfiles in this repo can be copied or symlinked to your user directory. The batch/shell scripts in `scripts/` can take care of this setup automatically.

## Windows Setup

After cloning the repository, run `scripts/setup-dotfiles-windows-user.bat`.

## Unix Setup

[WIP]
