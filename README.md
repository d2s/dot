# dot

. files for macOS & Linux environments


## Setup

```sh

# Clone the repository to a hidden subdirectory
git clone git@github.com:d2s/dot.git ~/.dotfiles

# Get the submodules to make sure zsh terminal works properly
git submodule init
git submodule update

# Link configuration files
ln -sf ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -sf ~/.dotfiles/git/gitignore_global ~/.gitignore_global

# Install related tools...
# TODO: Make a installer script for the commonly used tools

# After you have installed Node.js
# Install CLI tools from npm
~/.dotfiles/scripts/install-npm-packages.sh

```


## Dependencies

### Node.js

- [Installing Node.js with nvm](https://gist.github.com/d2s/372b5943bce17b964a79)

### Fonts

- [tonsky/FiraCode](https://github.com/tonsky/FiraCode) _(Monospaced font with programming ligatures)_
  - [Install instructions for the typeface](https://github.com/tonsky/FiraCode/wiki)
- [Font Awesome](http://fontawesome.io/) _(icon font and CSS toolkit)_
  - Download zip file
  - Uncompress zip file.
  - Open `fonts/FontAwesome.otf` file to add it to the operating system.

### Tools

- [antigen][] is used for managing zsh configs.

[antigen]: https://github.com/zsh-users/antigen "A plugin manager for zsh."
