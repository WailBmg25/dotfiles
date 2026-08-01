# Clone It, Stow It, and Enjoy

Elevate your Arch Linux setup with a configuration that embodies precision and style. This repository is tailored for those who demand excellence in their workflow.

## Components

- **OS:** Arch Linux
- **WM:** Hyprland
- **Shell:** Zsh
- **Terminal:** Kitty
- **Panel:** Waybar
- **Editor:** Neovim
- **Launcher:** Rofi

## Philosophy

In the high-stakes world of computing, efficiency and elegance are non-negotiable. This configuration is designed to remove obstacles, ensuring you operate at peak performance.

## Tool Highlights

- **Hyprland:** A dynamic tiling Wayland compositor that offers exceptional performance and flexibility.
- **Zsh:** A powerful shell with advanced features for streamlined command execution.
- **Kitty:** A fast, feature-rich terminal emulator supporting graphics and Unicode.
- **Waybar:** A customizable status bar providing real-time system insights.
- **Neovim:** An extensible text editor that enhances coding and editing efficiency.
- **Rofi:** A versatile application launcher and window switcher for fluid navigation.

## Installation (fresh Arch + HyDE reinstall)

1. **Install HyDE first** (base packages, themes, wallpapers, fonts): follow
   https://github.com/prasanthrangan/hyprdots. This repo only overlays personal
   config on top of a working HyDE install — it does not install HyDE itself.

2. **Clone this repository:**

   ```bash
   git clone git@github.com:WailBmg25/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

3. **Run the setup script:**

   ```bash
   ./setup.sh
   ```

   This installs GNU Stow (if missing) and symlinks every package here
   (`~/.config/hypr`, `waybar`, `kitty`, `nvim`, `rofi`, `zsh`, `tmux`, and
   `~/.local/share/bin`) into place. Existing real files/dirs at those paths
   will make stow fail with a conflict — move them aside first if this isn't
   a fresh HyDE install.

4. **Log out / restart Hyprland** so `exec-once` entries (waybar, cliphist
   watchers, etc.) pick up the linked configs.

Not covered by this repo (regenerate via HyDE's own tools after install):
theme/wallpaper selection (`~/.config/hyde/hyde.conf`), installed packages.

## Packages in this repo

| Package | Links to |
|---|---|
| `hypr` | `~/.config/hypr` |
| `waybar` | `~/.config/waybar` |
| `kitty` | `~/.config/kitty` |
| `nvim` | `~/.config/nvim` |
| `rofi` | `~/.config/rofi` |
| `tmux` | `~/.tmux.conf` |
| `zsh` | `~/.zshrc` |
| `local-bin` | `~/.local/share/bin` (HyDE helper scripts, incl. personal fixes to `cliphist.sh` and `systemupdate.sh`) |

## Conclusion

Success isn't a matter of chance; it's a matter of preparation. This configuration equips you with the tools to operate with confidence and style. Embrace it, and transform your computing environment into a model of productivity and elegance.
