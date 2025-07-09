# dotfiles

Work in progress

For the momment, it only includes config files for :
- hyprland
- neovim
- kitty
- starship
- nushell
- bash
- Codium
- btop

## Gnome Ricing

- Shell/GTK Theme: [RosePine](https://github.com/Fausto-Korpsvart/Rose-Pine-GTK-Theme)

## TODO
- [x] manage chezmoi's config
- [x] better handling of files externaly modified (see [there](https://www.chezmoi.io/user-guide/manage-different-types-of-file/#handle-configuration-files-which-are-externally-modified))
- [x] manage file permission of hypr/scripts (by adding `executable_` prefix)
- [ ] clean the target directory depending on the installed program using `--dry-run` (see [there](https://www.chezmoi.io/user-guide/manage-different-types-of-file/#ensure-that-a-target-is-removed))

# Installation (WIP)

## Disclaimer

This repo is intended to be used with my personnal linux image (link) generated with bluebuild (link).
While you can use this repo with any distro, downloading these dotfiles along my image makes it painless to install all my softwares and bonus it makes it trully reproducible on another machine.


- fork this repo and run the bluebuild workflow
- A workflow to generate an ISO will be available Soon TM.

But for now you can install any `rpm-ostree` based distro (such as Silverblue or Bazzite) and run :

`rpm-ostree rebase ostree-unverified-registry:ghcr.io/benoitlx/niri:br-niri-42`

`systemctl reboot`

At this point all the softwares needed to reproduce my setup are available on your pc and the dotfiles are automaticaly downloaded in `~/.local/share/chezmoi/` within a minute after the first boot.

`rpm-ostree rebase ostree-image-signed:docker://ghcr.io/benoitlx/niri:br-niri-42`

`systemctl reboot`


## Post Install

- Apply a color theme and set a wallpaper -> `wallSelect.sh`
- générer une clée ssh
- firefox -> synchro -> bitwarden
- Connexion discord whatsapp finamp ...
- setup backup

## Update

- you need to rebuild your image (e.g. with the CI)
- run `rpm-ostree upgrade`

## Daily maintenance

Recommended way of adding software :
- flatpak for graphical app (see distrobox if your app is not package as a flatpak)

CLI tool :  distrobox
