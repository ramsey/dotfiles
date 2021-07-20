ramsey's dotfiles
-----------------

Dependencies:

* Git
* Python development headers
* Ruby development headers
* ZSH
* Rake
* pip

Install dependencies (I use this on Ubuntu; your command may differ):

```
sudo apt-get update
sudo aptitude install git zsh rake python-pip python-dev ruby-dev
pip install virtualenvwrapper
pip install git+git://github.com/Lokaltog/powerline
pip install psutil
pip install editorconfig
```

Install a [Nerd Font](https://www.nerdfonts.com).

Get the source:

    git clone git://github.com/ramsey/dotfiles.git .dotfiles

Install the dotfiles:

    cd .dotfiles && rake install

Change your shell:

    chsh -s /bin/zsh

Log out and log back in. Boom!

Open `vim` and run:

    :call pathogen#helptags()
