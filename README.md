# This is my NixOS configuration

It's still a work in progress but I will make it better in the long run.

This is a modular aproach of aplying my NixOS configuration, you can use it at will.

## Commands

### Initial rebuild of system with git and neovim

1. Edit `/etc/nixos/configuration.nix`:
```nix
# Add new packages
environment.systemPackages = with pkgs; [
    neovim
    git
];

# Enable flakes and Homemanager
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

2. Rebuild system with new packages
```bash
sudo nixos-rebuild switch
```

3. Clone this repo
```bash 
git clone https://github.com/FilipeS0usa/MyNixOS.git ~/nixos
```

4. Copy our hardware file to hosts
```bash 
sudo cp /etc/nixos/hardware-configuration.nix ~/nixos
```

5. Update Flake so that we don't have any incompatibility
```bash 
nix flake update
```

6. Rebuild the system with the host that you selected
```bash 
sudo nixos-rebuild switch --flake .#main
```






