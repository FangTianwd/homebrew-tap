# FangTianwd Homebrew Tap

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

个人 Homebrew Tap，包含自制软件包。

## 安装方法

```bash
# 添加 tap
brew tap fangtianwd/homebrew-tap

# 安装软件
brew install <formula>

# 查看可用软件
brew search fangtianwd/homebrew-tap
```

## 可用软件包

### mdns-reflector-go

mDNS 报文反射工具，用于在不同网络接口之间转发多播 DNS 报文。

```bash
brew install fangtianwd/homebrew-tap/mdns-reflector-go
```

**功能特性：**
- 🚀 高效的 mDNS 报文反射
- 🔄 支持多网络接口
- 🐳 Docker 环境友好
- 🍺 Homebrew 安装支持

**更多信息：** [项目主页](https://github.com/FangTianwd/mdns_reflector_go)

## 为这个 Tap 贡献

### 添加新软件包

1. 在 `Formula/` 目录下创建新的 formula 文件
2. 提交 Pull Request
3. CI 会自动验证 formula 语法

### Formula 要求

- 使用 `#{version}` 变量而非硬编码版本
- 包含必要的测试
- 遵循 Homebrew 命名约定
- 添加合适的描述和许可证信息

## 文档

- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [创建和维护 Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)

## 许可证

本 Tap 中的软件包遵循各自的许可证。
