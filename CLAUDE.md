# CLAUDE.md - 元企科技与机器人学校 Logo 资产调用指南

本指南专为 Anthropic Claude Code 及 Claude 智能体设计，规范在开发、设计和文档编写中如何自动选用与引用元企科技 (YuanQi Tech) 及旗下 yuanqee 机器人学校官方 Logo 资产。

---

## 快速调用指南 (Decision Matrix)

| 场景需求 | 推荐格式 | 元企科技 (YuanQi Tech) | yuanqee 机器人学校 (Robot School) |
| :--- | :--- | :--- | :--- |
| **日常通用 / 官网首页 / 默认未指定** | Web PNG (512px) 或 SVG | `02_png/yuanqi_logo_color_web_512.png`<br>`01_source/yuanqi_logo_color_master.svg` | `02_png/yuanqee_school_logo_color_web_512.png`<br>`01_source/yuanqee_school_logo_color_master.svg` |
| **深色底 / 暗黑模式 / 黑底海报** | 反白透明底 PNG 或 SVG | `02_png/yuanqi_logo_white_web_512.png`<br>`01_source/yuanqi_logo_white_master.svg` | `02_png/yuanqee_school_logo_white_web_512.png`<br>`01_source/yuanqee_school_logo_white_master.svg` |
| **合同 / 盖章 / 单色黑白打印** | 高清纯黑 PNG 或 CMYK PDF | `02_png/yuanqi_logo_black_office_2000.png`<br>`05_print/yuanqi_logo_black_print_cmyk.pdf` | `02_png/yuanqee_school_logo_black_office_2000.png`<br>`05_print/yuanqee_school_logo_black_print_cmyk.pdf` |
| **头像 / App 图标 / 水印 / 小尺寸** | 纯图标 PNG 或 SVG | `03_avatar/yuanqi_logo_avatar_master_1080.png`<br>`01_source/yuanqi_logo_icon_master.svg` | `03_avatar/yuanqee_school_logo_avatar_master_1080.png`<br>`01_source/yuanqee_school_logo_icon_master.svg` |
| **网站 Favicon / 浏览器书签图标** | .ico 或 32px PNG | `04_favicon/favicon.ico`<br>`04_favicon/yuanqi_logo_favicon_32.png` | `04_favicon/yuanqee_school_favicon.ico`<br>`04_favicon/yuanqee_school_logo_favicon_32.png` |
| **展会大屏 / 招商画册 / Slogan 横幅**| 4K 高清图或横版 SVG | `01_source/yuanqi_logo_color_horizontal_master.svg`<br>`02_png/yuanqi_logo_color_hd_4000.png` | `01_source/yuanqee_school_logo_color_horizontal_master.svg`<br>`02_png/yuanqee_school_logo_color_hd_4000.png` |

---

## 品牌规范红线 (Brand Guardrails)

- **科技蓝**：`#0E3183` (RGB: 14, 49, 131)
- **学校活力橙**：`#EA5B18` (RGB: 234, 91, 24)
- **纯透明底**：所有反白与彩色 PNG 均为透明通道，严禁自带白色矩形外框。
- **严禁拉伸变形**：必须保持原始宽高比。

---

## 辅助检索工具 (CLI Helper)

```bash
# 查询机器人学校资产
node scripts/get_logo.js --brand school --scenario default --json
# 查询元企科技资产
node scripts/get_logo.js --brand tech --scenario dark_mode --format png
```
