My Dotfiles
===========

### Quick Start

```shell
cd ~
git clone https://github.com/schrectacular/.dotfilez
cd .dotfilez
git submodule update --init --recursive
./install
```

### Included:

- zprezto
- dotbot
- Vundle

#### Operations Performed:
- Recursively updates and installs submodules:
    * **dotbot & dotbot-brew**: The framework which runs the whole operation, it's a set of python scripts that interprets this config file into shell instructions. Notably, it is idempotent, meaning subsequent invocations of the install script won't cause any problems.
    * zprezto: a quick zsh framework which offers a suite of functions that make command-line life much more pleasurable.
    * zsh-prompt-garrett: prompt style for zprezto
    * Vundle: A vim plugin plugin, this manages the download and update of vim plugins.
- Links my custom config files for
    * zpretzorc
    * zprofile
    * zshrc
- Tries to set default shell to zsh

#### OSX:
- Installs a basic package of: brew, cask, zsh, tmux, macvim, iterm2
- Sets some "sane defaults" in the macos script

#### Linux:
- On systems with apt, installs vim, tmux, ctags, and zsh



### Setup to edit locally

- [Set up SSH](https://help.github.com/articles/connecting-to-github-with-ssh/)
- Install git
- |
    ```shell
    mkdir ~/.dotfilez; cd ~/.dotfilez
    git init
    git remote add origin git@github.com:schrectacular/.dotfilez.git
    git pull origin master
    ```
