Usage:

### Nix installation
---

```bash
$ curl -L https://nixos.org/nix/install | sh -s -- --darwin-use-unencrypted-nix-store-volume
```

See https://nixos.org/manual/nix/stable/#sect-macos-installation for more info

Once Nix is installed, follow https://github.com/nix-community/home-manager#installation to install `home-manager`

### Symlink the home-manager config:
---

```
stow --dotfiles nix --target=$HOME/.config
```
