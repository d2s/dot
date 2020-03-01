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

# Link Zsh configuration files
ln -sf ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc

# Link Git configuration files
ln -sf ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/git/gitignore_global ~/.gitignore

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

# Get the submodule dependencies (not be needed anymore)
#   NOTE: colors palette
#
# git submodule init
# git submodule update

```


## Git configuration

Create a `~/.gitconfig.local` file for the local overrides.
It allows you to adjust Git configs for system-specific needs
while keeping the shared settings in the version control.

```sh
touch ~/.gitconfig.local
code ~/.gitconfig.local
```


### Example local Git config file

```txt

[user]
  name = Firstname Lastname
  email = user@example.com
  # signingkey = 0000000000000000

[github]
  user = your_github_username

```

### Sign Git commits with a GPG key

GPG key is required for creating new Git commits.
Update the `signingkey` part of `~/.gitconfig.local` file to match your local system.

More details about how to sign Git commits with a GPG key is available from the following article:

- [Signing commits - GitHub Help](https://help.github.com/articles/signing-commits-using-gpg/)


## Dependencies to install manually

- Node.js
  - [Installing Node.js with nvm](https://gist.github.com/d2s/372b5943bce17b964a79)
- `hub`
  - [Releases · github/hub · GitHub](https://github.com/github/hub/releases)


### Create common directories

```sh
mkdir ~/bin
mkdir ~/Documents/git
```


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


