# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Waybar configuration directory for a Hyprland window manager setup on Arch Linux. Waybar is a customizable status bar for Wayland compositors.

## Configuration Structure

The configuration is split across three main files:

- `config.jsonc`: Main configuration file defining the bar layout, positioning, and module inclusion
- `modules.json`: Detailed module configurations for all waybar modules (workspaces, media, system info, etc.)
- `style.css`: Complete styling definitions including colors, fonts, hover effects, and theming

## Architecture

### Module Organization
- **Left modules**: Custom Arch logo and Hyprland workspaces grouped together, plus separate media controls
- **Center modules**: Active window title display
- **Right modules**: System monitoring (CPU, memory, temperature), audio controls, and clock

### Key Design Patterns
- Uses module groups (`group/main-left`, `group/media`) to create separate rounded containers in the left section
- Modular configuration with include statements to separate concerns
- Consistent color scheme using Tokyo Night-inspired dark theme with transparency
- Font requirements: SpaceMono Nerd Font and FontAwesome for proper icon display

### Important Module Configurations
- Temperature monitoring configured for specific hardware path (`/sys/class/hwmon/hwmon2/temp1_input`)
- MPRIS media controls with custom ignored players (Firefox)
- Pulseaudio integration with pavucontrol click action
- Hyprland-specific workspace and window integration

## Theming

The configuration uses a dark theme with:
- Semi-transparent backgrounds (rgba values with 0.7-0.75 alpha)
- Tokyo Night color palette (#c0caf5, #1793d1, etc.)
- Rounded corners (15px border-radius)
- Hover effects with background color transitions
- Grouped modules in separate oval containers

## Common Tasks

To modify the bar configuration:
1. Edit `config.jsonc` for layout and module ordering
2. Edit `modules.json` for specific module behaviors and formatting
3. Edit `style.css` for visual styling and theming

After making changes, reload Waybar to see updates (typically `killall waybar && waybar &`).