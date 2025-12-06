# **Hei Cursor Theme**

[中文](./README.md) | English

## About

- **Original Author**: [Bilibili @1013625945 (漓翎_cub)](https://space.bilibili.com/1013625945)
- **Ported by**: [GitHub @Tseshongfeeshur (Ryan)](https://github.com/Tseshongfeeshur)

As of the project’s release date (2025-12-06), the original author has only provided versions for Windows and macOS. Since no GNU/Linux version was available, this theme has been ported into an [XDG cursor theme package](https://specifications.freedesktop.org/icon-theme/latest/) that works with most Linux desktop environments. **Great thanks to the original author — without his work, this port would not exist, and we wouldn’t be able to enjoy such a beautiful cursor theme.**

## Project Content

- Based on the character **“Hei”** from the series [*The Legend of Hei*](https://www.bilibili.com/bangumi/play/ep32374), designed and created by **[漓翎_cub](https://space.bilibili.com/1013625945)**
- **Mostly** animated cursors
- Supports **24 / 32 / 48 / 64 / 96 / 128 / 192 / 256** pixel resolutions

## Supported Targets

- All GNU/Linux desktop environments that support XDG cursor themes
  - Fully tested and works well under [KDE Plasma](https://kde.org/plasma-desktop/)

## Installation

### Arch Linux

```bash
yay -S hei-cursors
```

**Or**, using any other AUR helper you prefer:

```bash
paru -S hei-cursors
```

**Or**, install manually **(not recommended, as `pacman` will not track the package)**.

### Manual Installation

Install for the **current user**:

```bash
git clone https://github.com/Tseshongfeeshur/hei-cursors.git hei_cursors
mv ./hei_cursors ~/.local/share/icons/
```

**Or**, install for **all users** **(not recommended)**:

```bash
git clone https://github.com/Tseshongfeeshur/hei-cursors.git hei_cursors
sudo mv ./hei_cursors /usr/share/icons/
```

## Acknowledgements

- **Original author** [漓翎_cub](https://space.bilibili.com/1013625945).
  Without his contribution, this project would not exist.
- [`win2xcur`](https://github.com/quantum5/win2xcur), for providing an almost lossless converter from Windows `.cur/.ani` to Xcursor format
- `xorg-xcursorgen`, for making multi-resolution cursor generation convenient and reliable
