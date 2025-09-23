# My personnal dotfiles

> [!warning]
> This repository is a continuous work in progress and some config files may be poorly maintained !

My dotfiles are managed with [`chezmoi`](https://www.chezmoi.io/), a handy tool to manage configuration files against a remote repository !

Below are the managed softwares:

| Config file | Status |
| ----------- | ------ |
| kitty       | maintained |
| starship | maintained |
| btop | minimal maintainance |
| helix      | maintained |
| cava      | minimal maintainance |
| ironbar | maintained |
| matugen | maintained |
| niri | maintained |
| hyprland | not maintained |
| nushell | planned |
| nvim | not maintained |
| Codium (include extension settings) | not maintained |
| rofi | minimal maintainance |
| waybar | not maintained |
| waypaper | not maintained |
| yazi | minimal maintainance |
| zellij | minimal maintainance |
| bashrc | minimal maintainance |
| zsh config | not maintained |

This repository also include some usefull scipts (and other not so usefull) in [`bin/`](./bin) !


# Installation (WIP)

## Disclaimer

This repo is intended to be used with my personnal linux image (link) generated with bluebuild (link).
While you can use this repo with any distro, downloading these dotfiles along with my image makes it painless to install all the softwares and bonus it makes it trully reproducible on another machine.


- fork this repo and run the bluebuild workflow
- A workflow to generate an ISO will be available Soon TM.

But for now you can install any `rpm-ostree` based distro (such as Silverblue or Bazzite) and run :

- setup encryption (while setting up the `rpm-ostree` distro)

`rpm-ostree rebase ostree-unverified-registry:ghcr.io/benoitlx/niri:br-niri-42`

`systemctl reboot`

At this point all the softwares needed to reproduce my setup are available on your pc and the dotfiles are automaticaly downloaded in `~/.local/share/chezmoi/` within a minute after the first boot.

`rpm-ostree rebase ostree-image-signed:docker://ghcr.io/benoitlx/niri:br-niri-42`

`systemctl reboot`


## Post Install

- TODO check this section with a clean install (some elements may be misunderstood)
  - check `rbw login` and `rbw unlock` (it's in barshrc so it will be one of the first thing executed once logged in)

- Enroll MOK key if using secure-boot (see ublue doc)
- Apply a color theme and set a wallpaper -> `wallSelect.sh` TOFIX: will only work within a graphical session
  - This step is important because some config files are generated through this script (e.g. niri config) (via `matugen`)
- generate an ssh key with a passphrase and push it to vaultwarden (or generate it directly in vaultwarden)
  - [github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  - [Bitwarden](https://bitwarden.com/help/ssh-agent/)
  - don't forget to add your public key where needed (in github, on different machines, ...)
- firefox -> synchro -> bitwarden
- `tailscale login`
- Connexion discord whatsapp finamp thunderbird ...
- setup backup

## Update

- you need to rebuild your image (e.g. with the CI)
- run `rpm-ostree upgrade` (todo: look at the difference with `bootc upgrade`)

## Daily maintenance and usage

Note: maybe I should move this section to my image repository's README.

- handy script: `ujust`

Recommended way of adding software :
- flatpak for graphical app (see distrobox if your app is not package as a flatpak)

CLI tool :  distrobox


## TODO
- [x] manage chezmoi's config
- [x] better handling of files externaly modified (see [there](https://www.chezmoi.io/user-guide/manage-different-types-of-file/#handle-configuration-files-which-are-externally-modified))
- [x] manage file permission of hypr/scripts (by adding `executable_` prefix)
- [ ] clean the target directory depending on the installed program using `--dry-run` (see [there](https://www.chezmoi.io/user-guide/manage-different-types-of-file/#ensure-that-a-target-is-removed))
- [ ] add a config file with my vaultwarden address and some global metadata (will be usefull to automate some post install steps)
- [ ] find a way to deploy distroboxes with custom softwares in it (e.g. softwares for my rizz bin)
- [ ] find a way to automaticaly deploy a last maintained date alongside all the softwares in this README

## Acknowledgments

TODO
