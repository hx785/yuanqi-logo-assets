# 元企科技 Logo 资产库 (YuanQi Tech Logo Skill)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Agent Skills Spec](https://img.shields.io/badge/Agent_Skills-1.0.0-emerald.svg)](./SKILL.md)

元企科技官方全套矢量母版与透明位图资源库，原生适配 **Claude Code、OpenAI Codex、Tencent WorkBuddy、Antigravity、Cursor**。

---

## 交付预览 (Preview)

![Contact Sheet](./contact_sheet.png)

---

## 极速安装 (Installation)

### 1. 一键远程安装
- **macOS / Linux**：
  ```bash
  curl -fsSL https://raw.githubusercontent.com/hx785/yuanqi-logo-assets/main/install.sh | bash
  # 或使用 SSH: curl -fsSL https://raw.githubusercontent.com/hx785/yuanqi-logo-assets/main/install.sh | bash -s -- --ssh
  ```
- **Windows (PowerShell)**：
  ```powershell
  irm https://raw.githubusercontent.com/hx785/yuanqi-logo-assets/main/install.ps1 | iex
  ```

### 2. Git Clone 安装（SSH / HTTPS）
```bash
# Claude Code
git clone git@github.com:hx785/yuanqi-logo-assets.git ~/.claude/skills/yuanqi-logo-assets

# WorkBuddy
git clone git@github.com:hx785/yuanqi-logo-assets.git ~/.workbuddy/skills/yuanqi-logo-assets

# Antigravity
git clone git@github.com:hx785/yuanqi-logo-assets.git ~/.gemini/config/skills/yuanqi-logo-assets

# 项目工程 (Codex / Cursor)
git clone git@github.com:hx785/yuanqi-logo-assets.git .agents/skills/yuanqi-logo-assets
```
*(如使用 HTTPS，将 `git@github.com:` 替换为 `https://github.com/` 即可)*

---

## 常用资产与场景索引 (Quick Reference)

| 场景 | 推荐格式 | 推荐文件路径 |
| :--- | :--- | :--- |
| **日常通用 / 官网** | 512px Web / SVG | `02_png/yuanqi_logo_color_web_512.png`<br>`01_source/yuanqi_logo_color_master.svg` |
| **深色底 / 暗黑模式** | 反白透明底 | `02_png/yuanqi_logo_white_web_512.png`<br>`01_source/yuanqi_logo_white_master.svg` |
| **合同 / 黑白打印** | 单色纯黑 | `02_png/yuanqi_logo_black_office_2000.png`<br>`05_print/yuanqi_logo_black_print_cmyk.pdf` |
| **头像 / App 图标** | 纯图标 (方形) | `03_avatar/yuanqi_logo_avatar_master_1080.png`<br>`02_png/yuanqi_logo_icon_apple_180.png` |
| **网站 Favicon** | .ico 多分辨率 | `04_favicon/favicon.ico` |
| **展会 / 招商画册** | 完整横版 / 4K | `01_source/yuanqi_logo_color_horizontal_master.svg`<br>`02_png/yuanqi_logo_color_hd_4000.png` |

- **品牌核心色**：科技蓝 `#0E3183` (RGB: 14, 49, 131) | 深黑 `#141414` | 反白 `#FFFFFF`
- **详细规约与代码集成**：详见 [SKILL.md](./SKILL.md) 与 [README.txt](./README.txt)

---

## 许可证 (License)

[MIT License](./LICENSE) © 2026 YuanQi Tech
