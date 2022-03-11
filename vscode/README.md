### Backup settings

```bash
$ cp ~/Library/Application\ Support/Code/User/settings.json ~/.dotfiles/vscode
```

### Load settings

```bash
$ cp ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

### Backup extensions

```bash
$ code --list-extensions >> extensions.txt
```

### Load extensions

```bash
cat extensions.txt | xargs -n 1 code --install-extension
```