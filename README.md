# FileMgr

一个适用于Windows的、简单轻量的GUI文件管理器，可以完成命令提示符(cmd)或Windows资源管理器无法做到的许多事情。如果你曾因Windows文件系统的限制而感到沮丧，这个工具就是为你准备的。

[![GitHub release](https://img.shields.io/github/release/3-1415f/FileMgr.svg)](https://github.com/3-1415f/FileMgr/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🌟 主要功能

FileMgr 旨在突破 Windows 文件系统的传统限制，赋予你更强的文件控制能力。

### 🌊 备用数据流 (ADS) 支持
- 在文件路径后使用冒号 `:` 来浏览数据流，例如 `C:\path\to\file:`。或者右键文件,选择 "数据流"。
- **打开方式**：由于 Windows `ShellExecute` 的局限性，无法直接双击打开 ADS。你可以右键点击文件，选择 "记事本" 来编辑流内容，或者将 ADS 复制到其他位置再尝试打开。

### 🚫 管理保留名称文件(夹)
- 支持创建、删除和访问 Windows 系统保留的设备名称，如 `CON`, `PRN`, `AUX`, `NUL`, `COM1`-`COM9`, `LPT1`-`LPT9`。

### 🔚 管理以点或空格结尾的文件(夹)
- 支持创建、删除和访问以点 (`.`) 或空格 (` `) 结尾的文件，例如 `...` 或 `My Folder `。

### 📏 长路径支持 (最长 32768 字符)
- 摆脱传统 Windows 文件路径 260 个字符的长度限制。

### *对于以上三项功能，你需要点击地址栏左侧按钮打开`super`模式（开启时显示为加号）。您需知打开这个功能可能会带来文件损坏的风险。

## 📥 下载与安装

FileMgr 是一个绿色软件，无需安装。

1. 访问本项目的 [Releases 页面](https://github.com/3-1415f/FileMgr/releases)。
2. 下载最新版本的 `FileMgr.exe`。
3. 双击运行即可开始使用。

## 🤝 贡献

欢迎提交 Issue 来报告 Bug 或提出新功能建议！如果你想贡献代码，请：

1. Fork 本仓库。
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)。
3. 提交你的更改 (`git commit -m 'Add some AmazingFeature'`)。
4. 推送到分支 (`git push origin feature/AmazingFeature`)。
5. 开启一个 Pull Request。

## 📜 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。
