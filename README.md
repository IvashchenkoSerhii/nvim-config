# Nvim Config

## Install/Update nvim

[Nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

Add current folder to PATH:
```bash
$ echo 'export PATH=$HOME/APPS/nvim-config:${PATH}' >> ~/.zshrc
```
Update nvim script:
```bash
$ nvim-update
```

## Pyenv
[Install pyenv](https://github.com/pyenv/pyenv)

```bash
pyenv install 3.8.1
pyenv virtualenv 3.8.1 nvim3
pyenv local nvim3
pip install pynvim flake8 jedi pyflakes pycodestyle pydocstyle pylint
```

[Fix nvim & pyenv virtualenv](https://vi.stackexchange.com/questions/7644/use-vim-with-virtualenv/7654#7654)

## Config
Create links:
```
ln -sf $PWD/config $HOME/.config/nvim
```
