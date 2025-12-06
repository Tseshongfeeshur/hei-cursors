# 罗小黑主题鼠标指针

中文 | [English](./README_en-US.md)

## 关于项目

- **原作者**：[哔哩哔哩 @1013625945（漓翎_cub）](https://space.bilibili.com/1013625945)
- 移植者：[GitHub @Tseshongfeeshur（Ryan）](https://github.com/Tseshongfeeshur)

由于截至项目发布（2025.12.6），原作者仅为 Windows 和 MacOS 平台提供适配，尚未提供 GNU/Linux 版本，遂将其移植为适用于大多数桌面环境的 [XDG 主题包](https://specifications.freedesktop.org/icon-theme/latest/)，以供 GNU/Linux 用户使用。**特别感谢原作者的付出和努力，否则该移植项目不可能出现，我们也不可能用到如此精美的鼠标指针。**

## 项目内容

- 以在[《罗小黑战记》](https://www.bilibili.com/bangumi/play/ep32374)系列作品中出场的角色“罗小黑”为原型，由**[漓翎_cub](https://space.bilibili.com/1013625945)**设计并制作
- **大部分**为动态图标
- 支持 **24 / 32 / 48 / 64 / 96 / 128 / 192 / 256** 多分辨率

## 适用平台

- GNU/Linux 平台所有支持 XDG 主题包的桌面环境
  - 在 [KDE Plasma](https://kde.org/plasma-desktop/) 通过测试，表现良好

## 安装方式

### Arch Linux

```bash
yay -S hei-cursors
```

**或**选择其他您喜欢的 AUR 助手：

```bash
paru -S hei-cursors
```

**或**参见下文手动安装**（不建议，会导致** `pacman` **无法追踪该包）**。

### 其他（手动安装）

为**当前用户**安装：

```bash
git clone https://github.com/Tseshongfeeshur/hei-cursors.git hei_cursors
mv ./hei_cursors ~/.local/share/icons/
```

**或**为**所有用户**安装**（不建议）**：

```bash
git clone https://github.com/Tseshongfeeshur/hei-cursors.git hei_cursors
sudo mv ./hei_cursors /usr/share/icons/
```

## 鸣谢

- **原作者**[漓翎_cub](https://space.bilibili.com/1013625945)，没有他的付出，就没有这个项目
- [`win2xcur`](https://github.com/quantum5/win2xcur)，它提供了 Windows 鼠标指针格式（`.cur/.ani`）到 Xcursor 格式的近乎无损的转换方案
- `xorg-xcursorgen`，它为多分辨率图标的生成提供了很便捷的方式
