# dot

. files for Linux & macOS environments


## Setup

```sh
# If you don't already have Git installed:
# sudo apt install git

# Clone the repository via HTTPS to a hidden subdirectory
git clone https://github.com/d2s/dot.git ~/.dotfiles

# Clone the repository via SSH to a hidden subdirectory
# (if you have added SSH public key to GitHub's user settings)
#
# git clone git@github.com:d2s/dot.git ~/.dotfiles

# Install Zplugin
git clone https://github.com/zdharma/zplugin.git ~/.dotfiles/zsh/zplugin/bin

# Link configuration files
ln -sf ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -sf ~/.dotfiles/git/gitignore_global ~/.gitignore_global

# Install related tools...
# If on a Debian-based Linux system:
~/.dotfiles/scripts/install-apt-packages.sh

# If on a openSUSE-based Linux system:
~/.dotfiles/scripts/install-suse.sh

# Change default terminal shell to Zsh
chsh -s $(which zsh)

# After you have installed Node.js
# Install CLI tools from npm
~/.dotfiles/scripts/install-npm-packages.sh

# Get the submodules (not be needed anymore)
#   NOTE: colors palette
#
# git submodule init
# git submodule update

```


## Dependencies to install manually

- Node.js
  - [Installing Node.js with nvm](https://gist.github.com/d2s/372b5943bce17b964a79)


## More details

### Zsh extensions

- [Zplugin](https://github.com/zdharma/zplugin)
  - "Flexible Zsh plugin manager with clean fpath, reports, completion management, turbo mode, services"


## Optional packages to consider

### Fonts

- [tonsky/FiraCode](https://github.com/tonsky/FiraCode) _(Monospaced font with programming ligatures)_
  - [Install instructions for the typeface](https://github.com/tonsky/FiraCode/wiki)
- [Font Awesome](http://fontawesome.io/) _(icon font and CSS toolkit)_
  - Download zip file
  - Uncompress zip file.
  - Open `fonts/FontAwesome.otf` file to add it to the operating system.


