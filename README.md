**Config works for linux, and probably MACos (? perchance)**

- Might want to backup, or delete previous config files before adding my config so nothing gets messed with

```console
# For file backup (recommended)
mv ~/.config/nvim{,.bak}

# For file removal (also recommended)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

- To use, copy following line into terminal:

```console
git clone https://github.com/Shugarry/nvim_config.git ~/.config/nvim
```

- Also, you probably don't want my git files and README so you can delete them:

```console
rm -rf ~/.config/nvim/.git ~/.config/nvim/README.md
```

***!!! Warnings !!!***

You need to have rg (ripgrep) for telescope to function correctly

[Download Here](https://github.com/BurntSushi/ripgrep)
