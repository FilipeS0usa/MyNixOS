# This is my NixOS configuration

It's still a work in progress but I will make it better in the long run.

This is a modular approach of applying my NixOS configuration, you can use it at will.

## Setup

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

### NixOS

1. Clone this repo and go inside it

```bash
git clone https://github.com/FilipeS0usa/MyNixOS.git ~/nixos
cd ~/nixos
```

2. Copy our hardware file to hosts

```bash
sudo cp /etc/nixos/hardware-configuration.nix ~/nixos/hosts/main/hardware-configuration.nix
```

3. Update Flake (if you want to).

_*DISCLAIMER*_: I do it some times, because you can have some incompatibility with the fresh installed NixOS. I think there must be a way to enforce the flake build that we have configured, but I just didn't care... (Ex.: I had some problems with the bootloader, because the one that I already had installed was a newer version than the one that the flake had, so it wouldn't let me build my system for some reason, or maybe was just a warning and my system was build successfully, I GUESS WE WILL NEVER KNOW).

```bash
# Optional
nix flake update
```

4. Rebuild the system with the host that you selected

```bash
sudo nixos-rebuild switch --flake .#main
```

### Home Manager

The home manager installation that is being used is the [Standalone](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone) one.

1. First you have to install home-manager in your NixOS:

```bash
# This is for the master/unstable channel
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# For the specific channel use this one:
# nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install # I don't know if this is optional or not. I just do it for the sake of it.
```

2. Since we are using flakes, you will have to build the home manager this way:

```bash
home-manager switch --flake ~/nixos
```
