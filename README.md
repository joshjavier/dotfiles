# Josh's Dotfiles

A personal dotfiles repository managed by [chezmoi](https://www.chezmoi.io/), for managing configuration files across multiple machines.

## Overview

This repository contains configuration files for:
- **Bash shell** - Shell configuration and aliases
- **Git** - Git configuration and global gitignore
- **Neovim** - Neovim editor setup (NvChad configuration included)
- **Environment variables** - Custom environment setup

## Installation

### Prerequisites
- [chezmoi](https://www.chezmoi.io/install/) installed on your machine
- Git installed

### Quick Start

Initialize chezmoi with this repository:

```bash
chezmoi init --apply https://github.com/joshjavier/dotfiles.git
```

This will:
1. Clone the repository to `~/.local/share/chezmoi`
2. Apply all configurations to your home directory

If you don't want to apply all configurations automatically, remove the `--apply` flag.

### Manual Application

If you already have the repository cloned:

```bash
chezmoi apply
```

Or if you want to apply certain configs only:

```bash
chezmoi apply ~/.bashrc
chezmoi apply ~/.config/nvim
```

## File Structure

```
.
├── dot_bashrc                    # Bash shell configuration
├── dot_gitconfig                 # Git configuration
├── dot_gitignore_global          # Global Git ignore rules
├── dot_env                        # Environment variables
├── dot_config/                    # User config directory (~/.config)
│   ├── nvim/                      # Neovim configuration
│   └── nvim-nvchad/              # NvChad plugin configuration
└── executable_dot_azotebg        # Custom executable script
```

### Dotfile Naming Convention

Files prefixed with `dot_` map to `~/.` in your home directory:
- `dot_bashrc` → `~/.bashrc`
- `dot_gitconfig` → `~/.gitconfig`
- `dot_config/` → `~/.config/`

Files prefixed with `executable_` are installed with executable permissions.

## Usage

### Update Configurations

Edit files directly in this repository:

```bash
chezmoi edit ~/.bashrc        # Edit bashrc
chezmoi edit ~/.gitconfig     # Edit gitconfig
```

### Apply Changes

After editing, apply changes to your home directory:

```bash
chezmoi apply
```

### View What Changed

Preview changes before applying:

```bash
chezmoi diff
```

### Adding Updates to Chezmoi

Alternatively, what I like to do is update the config files directly, then add the changes to chezmoi.
For example, I update my neovim config directly, add the changes to chezmoi:

```bash
chezmoi add ~/.config/nvim
```

and then commit the changes to my dotfiles repo.

### Manage Multiple Machines

chezmoi supports machine-specific configurations. Use templating for machine-specific settings:

```bash
chezmoi add --template ~/.bashrc
```

## Features

- **Git integration** - Full git configuration and global ignore rules
- **Shell aliases** - Custom aliases for ls and grep with color
- **Git prompt** - Bash prompt shows current git branch
- **History search** - Arrow keys search through bash history
- **Neovim setup** - NvChad configuration for a modern vim experience
- **Environment management** - Load custom environment variables from `~/.env`

## Contributing

Personal dotfiles repository. For use across your machines.

## License

Personal use only.
