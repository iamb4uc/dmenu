# DoomMenu

DoomMenu is my personal fork of suckless `dmenu`, renamed all the way down to the command name. It keeps the small C/config.h workflow, but changes the feel with my fonts, colors, vi-style navigation, alpha support, centered layout, and a few quality-of-life patches.

The installed commands are:

- `doommenu`
- `doommenu_run`
- `doommenu_path`
- `stest`

## Build

```sh
make
```

Run a quick version check:

```sh
./doommenu -v
```

## Install

Edit `config.mk` if you want a different install prefix, then run:

```sh
sudo make install
```

Default install paths are based on:

- `PREFIX = /usr/local`
- `MANPREFIX = $(PREFIX)/share/man`

## Usage

Pipe newline-separated entries into `doommenu`:

```sh
printf 'lock\nlogout\nreboot\nshutdown\n' | doommenu -p 'Power:'
```

Launch programs from `$PATH`:

```sh
doommenu_run
```

Useful flags:

- `-b`: show at the bottom
- `-f`: grab keyboard before reading stdin
- `-i`: case-insensitive matching
- `-l <lines>`: vertical list mode
- `-h <height>`: minimum row height
- `-m <monitor>`: choose monitor
- `-p <prompt>`: set prompt text
- `-fn <font>`: set primary font
- `-nb/-nf/-sb/-sf`: override colors
- `-w <windowid>`: embed into a window

## Configuration

DoomMenu follows the suckless style: edit `config.h`, then rebuild.

Main things to tune:

- `fonts`: font stack
- `prompt`: default prompt text
- `colors`: normal, selected, output, and cursor colors
- `alpha` / `alphas`: transparency
- `lines`: default vertical list size
- `lineheight`: row height
- `vi_mode`: vi navigation behavior
- `quit_keys`: extra quit bindings
- `border_width`: X11 window border width

## Notes

This repo intentionally keeps the code close to suckless `dmenu`. The goal is not to become a large launcher framework; it is to stay fast, inspectable, and easy to rebuild after editing `config.h`.
