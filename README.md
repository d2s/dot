# dot

. files for macOS & Linux environments


## Setup

```sh
# If you don't already have Git installed:
# sudo apt install git

# Clone the repository to a hidden subdirectory
git clone git@github.com:d2s/dot.git ~/.dotfiles

# Another option is to use HTTPS instead of SSH
# if you haven't added SSH public key to GitHub's user settings
# git clone https://github.com/d2s/dot.git ~/.dotfiles

# Get the submodules
# NOTE: colors palette, might not be needed anymore
git submodule init
git submodule update

# Install Zplugin
git clone https://github.com/zdharma/zplugin.git ~/.dotfiles/zsh/zplugin/bin

# Link configuration files
ln -sf ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -sf ~/.dotfiles/git/gitignore_global ~/.gitignore_global

# Install related tools...
# If on a Debian-based Linux system:
~/.dotfiles/scripts/install-apt-packages.sh

# Change default terminal shell to Zsh
chsh -s $(which zsh)

# After you have installed Node.js
# Install CLI tools from npm
~/.dotfiles/scripts/install-npm-packages.sh

```


## Dependencies

- [Zplugin](https://github.com/zdharma/zplugin)
  - "Flexible Zsh plugin manager with clean fpath, reports, completion management, turbo mode, services"

### Node.js

- [Installing Node.js with nvm](https://gist.github.com/d2s/372b5943bce17b964a79)

### Fonts

- [tonsky/FiraCode](https://github.com/tonsky/FiraCode) _(Monospaced font with programming ligatures)_
  - [Install instructions for the typeface](https://github.com/tonsky/FiraCode/wiki)
- [Font Awesome](http://fontawesome.io/) _(icon font and CSS toolkit)_
  - Download zip file
  - Uncompress zip file.
  - Open `fonts/FontAwesome.otf` file to add it to the operating system.

