# CLAUDE.md - 元企科技 (YuanQi Tech) 品牌 Logo 资产调用指南

本指南专为 Anthropic Claude Code 及 Claude 智能体设计，规范在开发、设计和文档编写中如何自动选用与引用元企科技官方 Logo 资产。

---

## 快速调用指南 (Quick Decision Matrix)

当用户询问或需要 Logo 素材时，按照以下规则返回或嵌入相对路径：

| 场景关键词 / 意图 | 推荐输出格式 | 推荐文件路径 |
| :--- | :--- | :--- |
| **日常通用 / 官网首页 / 默认未指定** | Web PNG (512px) 或 SVG | `02_png/yuanqi_logo_color_web_512.png`<br>`01_source/yuanqi_logo_color_master.svg` |
| **深色底 / 暗黑模式 / 黑底海报 / 夜景** | 反白透明底 PNG 或 SVG | `02_png/yuanqi_logo_white_web_512.png`<br>`01_source/yuanqi_logo_white_master.svg` |
| **合同 / 盖章 / 激光黑白打印 / 纯黑单色** | 高清纯黑 PNG 或 CMYK PDF | `02_png/yuanqi_logo_black_office_2000.png`<br>`05_print/yuanqi_logo_black_print_cmyk.pdf` |
| **头像 / App 图标 / 水印 / 小尺寸** | 纯图标 PNG 或 SVG | `03_avatar/yuanqi_logo_avatar_master_1080.png`<br>`01_source/yuanqi_logo_icon_master.svg` |
| **网站 Favicon / 浏览器书签图标** | .ico 或 32px PNG | `04_favicon/favicon.ico`<br>`04_favicon/yuanqi_logo_favicon_32.png` |
| **商务名片 / 正式简洁公函** | CMYK 印刷 PDF 或 Web 图 | `05_print/yuanqi_logo_color_print_cmyk.pdf`<br>`02_png/yuanqi_logo_color_web_512.png` |
| **展会大屏 / 招商画册 / Slogan 横幅** | 4K 高清图或横版 SVG | `01_source/yuanqi_logo_color_horizontal_master.svg`<br>`02_png/yuanqi_logo_color_hd_4000.png` |

---

## 品牌规范红线 (Brand Guardrails)

- **品牌主色**：科技蓝 `#0E3183` (RGB: 14, 49, 131 | CMYK: 100, 80, 0, 20)。
- **严禁拉伸**：保持原始纵横比。
- **安全留白**：Logo 四周预留不小于图标高度 1/4 的空间。
- **反白透明**：所有白色反白 Logo 均为纯透明底，不可自带白色或灰色长方形底块。

---

## 命令行辅助工具 (CLI Helper)

可直接运行自带的轻量级检索脚本查询资产路径：
```bash
node scripts/get_logo.js --scenario dark_mode --format png
```
