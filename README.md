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
