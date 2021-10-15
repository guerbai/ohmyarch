# guerbai's Arch Linux Setup

![效果图](https://raw.githubusercontent.com/guerbai/scene/main/blog/20210928002146.png)

此项目主要是个人使用的Arch Linux初始化脚本，一键安装好常用软件及[suckless dwm](https://suckless.org/)窗口管理器，达到开箱即用的效果，不用再手动解决一个个依赖、配置问题

同时给对Arch Linux或者[Tiling Window Manager](https://en.wikipedia.org/wiki/Tiling_window_manager)感兴趣者提供一个示例，以减少**解决繁琐的依赖/配置问题**的时间

脚本会自动配置国内源，并尝试使用一些github仓库的gitee镜像版本

## 软件列表

| 软件名                  | 介绍                           |
| :---------------------- | ------------------------------ |
| git                     | 内容版本管理                   |
| xrandr                  | 使用其中的xrandr调整屏幕分辨率 |
| picom                   | 软件透明化(见效果图)           |
| sxiv                    | 查看图片                       |
| xwallpaper              | 设置壁纸                       |
| scrot                   | 截图工具                       |
| pulseaudio              | 音量调节                       |
| ranger                  | 文件管理                       |
| firefox                 | 火狐浏览器                     |
| fcitx/fcitx-sogoupinyin | 中文输入法                     |
| nerd-fonts-hack         | 显示emoji，unicode等字符       |
| unzip                   | 解压缩工具                     |
| rg                      | 模糊搜索工具                   |
| neovim                  | 代码编辑器                     |
| autojump                | 快速目录跳转                   |
| ohmyzsh                 | shell环境                      |
| zsh-autosuggestions     | zsh命令补全                    |
| clipmenu                | 剪贴板历史                     |
| neofetch                | 终端显示发行版与系统信息       |
| screenkey               | 按键操作可视化                 |
| tldr                    | 快捷命令行工具使用提示         |
| glances                 | 查看系统运行情况               |
| typora                  | markdown编辑器                 |

suckless的软件及壁纸来自[DistroTube](https://gitlab.com/dwt1)

| 软件名                                                    | 介绍                  |
| --------------------------------------------------------- | --------------------- |
| [dwm](https://gitlab.com/dwt1/dwm-distrotube)             | Tiling Window Manager |
| [dmenu](https://gitlab.com/dwt1/dmenu-distrotube)         | dwm下的应用启动工具   |
| [dwmblocks](https://gitlab.com/dwt1/dwmblocks-distrotube) | dwm状态栏显示配置     |
| [st](https://gitlab.com/dwt1/st-distrotube)               | 终端                  |
| [wallpapers](https://gitlab.com/dwt1/wallpapers)          | 壁纸                  |

## 安装使用

**前置依赖**    

运行脚本前需要:
- 安装好Arch Linux系统
- 安装好git来获取此repo

**发行版选择**    

可以选择Arch-Based桌面发行版(建议选择[Manjaro XFCE](https://manjaro.org/download/))，或根据install.sh中的执行顺序使用UEFI启动方式安装原生Arch Linux    
install.sh中分区、visudo等操作需要根据实际情况操作，有相应注释提示

**运行脚本**

```bash
cd ~ # 一定要在~下clone
git clone https://github.com/guerbai/ohmyarch
cd ohmyarch
chmod +x init.sh
bash init.sh
```

**命令支持**

由于国内网络环境问题，安装ohmyzsh或suckless软件时可能会出现超时，可使用如下命令检测安装完成情况：

```bash
bash init.sh check
```

![](https://raw.githubusercontent.com/guerbai/scene/main/blog/20210928010822.png)

若某一项安装出错可使用具体参数重试，具体见[代码](https://github.com/guerbai/ohmyarch/blob/master/init.sh)，比如上述情况，再分别运行：

```bash
bash init.sh suckless
bash init.sh ohmyzsh
```

**启动DWM**

Arch-Based发行版，可重启电脑/注销用户，在登录界面选择Dwm    
原生Arch Linux在重启电脑后，输入`startx`

![](https://raw.githubusercontent.com/guerbai/scene/main/blog/20210928011638.png)

DWM基本生存指南见[DWM](https://gitlab.com/dwt1/dwm-distrotube)

**neovim配置**
不会自动配置neovim，可以手动执行，具体配置说明见[vim-ide-solution](https://github.com/guerbai/vim-ide-solution)

```bash
bash init.sh neovim
```

## Arch Linux测试情况

其实没有必要纠结具体是哪个桌面发行版，因为用了suckless这些软件后所有的发行版都长一个样🤣

| 发行版        | 测试情况                                                     |
| ------------- | ------------------------------------------------------------ |
| Arch Linux    | 一切正常                                                     |
| Manjaro XFCE  | 一切正常                                                     |
| Garuda KDE    | 一切正常                                                     |
| Endeavour os  | 一切正常                                                     |
| Manjaro Gnome | base-devel无法安装，有`pacman-contrib`的依赖不兼容问题       |
| Archcraft     | 无法调节分辨率为1920x1080                                    |
| Chakra        | 无法调节分辨率为1920x1080                                    |
| Artix         | 无法正常安装中文输入法，target not found，此发行版需要特殊的源配置 |

## 鸣谢

- 直接使用了[DistroTube](https://gitlab.com/dwt1)的suckless软件配置并对字体大小稍做微调
- 从[DistroTube](https://www.youtube.com/c/DistroTube)制作的视频中了解到了Tiling Window Manager等概念与基本用法
- 编写脚本过程中时常参考阮一峰编写的[Bash 脚本教程]()

## Have Fun  : P
