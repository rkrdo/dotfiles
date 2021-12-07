Usage:

### Nix installation
---

```bash
$ sh <(curl -L https://nixos.org/nix/install) --daemon
```

See https://nixos.org/manual/nix/stable/installation/installing-binary.html#installing-a-binary-distribution for more info

Once Nix is installed, follow https://github.com/nix-community/home-manager#installation to install `home-manager`

### Symlink the home-manager config:
---

https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

```
stow nix
```
