---
name: yuanqi-logo-assets
version: 1.0.0
author: YuanQi Tech
description: >-
  元企科技 (YuanQi Tech) 官方 Logo 资产库与场景调用指南。当用户需要获取元企科技 Logo 素材、在网页/应用/文档中嵌入 Logo、配置社交媒体（微信/抖音/B站/小红书/知乎/微博/LinkedIn/X）头像与头图、准备印刷品（名片/合同/易拉宝），或需要依据设计规范自动挑选最合适尺寸与配色的 Logo 资产时激活此 Skill。
inputs:
  - name: scenario
    type: string
    required: false
    description: 使用场景（可选：default, dark_mode, monochrome_print, avatar, icon, business_card, expo_slogan, wordmark）
  - name: format
    type: string
    required: false
    default: png
    description: 期望文件格式（svg, png, pdf, ico）
compatibility:
  - antigravity
  - claude-code
  - codex
  - workbuddy
  - cursor
  - copilot
---

# 元企科技 (YuanQi Tech) Logo 官方资产库与调用规范 Skill

本 Skill 封装了「元企科技」全套官方 Logo 设计资产与印前交付物。涵盖矢量母版（SVG / PDF）、多尺寸透明底位图（PNG）、全平台社交媒体头图与头像、多分辨率 Favicon、CMYK 印刷文件以及严格的品牌视觉规范。
已原生适配 **Antigravity、Claude Code、OpenAI Codex、Tencent WorkBuddy、Cursor 及 Copilot** 等主流智能体系统。

---

## 1. 资产全局概览与预览图

- **全局预览看板**：[contact_sheet.png](./contact_sheet.png)
- **品牌规范说明**：[README.md](./README.md) / [README.txt](./README.txt)
- **印前出血规范**：[05_print/print_spec_bleed_3mm.txt](./05_print/print_spec_bleed_3mm.txt)
- **辅助检索脚本**：[scripts/get_logo.js](./scripts/get_logo.js)

---

## 2. 场景匹配与决策规则 (Decision Rules)

在接收到用户或系统针对 Logo 的调用诉求时，按照以下决策树自动匹配输出对应的资产路径：

```
                             ┌── 诉求为「头像 / 图标 / 水印 / 小尺寸 / Favicon」?
                             │    ├── Favicon 网页图标 ────> 04_favicon/favicon.ico
                             │    ├── 移动端 App 图标 ─────> 02_png/yuanqi_logo_icon_apple_180.png 或 android_192.png
                             │    ├── 社交媒体通用头像 ────> 03_avatar/yuanqi_logo_avatar_master_1080.png
                             │    └── 纯图标矢量母版 ──────> 01_source/yuanqi_logo_icon_master.svg
                             │
                             └── 否 ── 确定【排版款式】与【配色体系】：
                                       │
                                       ├─ 1. 排版款式判断：
                                       │    ├─ 提到「名片、正式、简洁」 ──────────> 分隔线款 / 标准款
                                       │    ├─ 提到「展会、宣传册、业务介绍」 ────> 完整横版 / 带 Slogan 标语款
                                       │    └─ 常规/默认展示 ──────────────────────> 标准居中款
                                       │
                                       └─ 2. 配色体系判断：
                                            ├─ 提到「深色背景、黑底、夜间模式、海报」 ──> 【反白白字版 (white)】
                                            ├─ 提到「文档、单色印刷、合同、黑白」 ──────> 【单色纯黑版 (black)】
                                            └─ 默认/未指定配色 ──────────────────────────> 【品牌标准蓝 (color)】
```

### 核心规则速查清单：

1. **默认规则**：用户未明确指定配色与款式时，默认输出 **品牌标准蓝主款**：
   - 网页/界面首选：`02_png/yuanqi_logo_color_web_512.png`
   - 矢量渲染母版：`01_source/yuanqi_logo_color_master.svg`
2. **深色背景/反白规则**：当应用场景为「深色背景、黑底、暗色海报、夜间模式 UI」时，匹配 **反白纯白版本 (White)**：
   - 矢量源文件：`01_source/yuanqi_logo_white_master.svg`
   - 透明底 PNG：`02_png/yuanqi_logo_white_web_512.png`（纯透明通道，无灰白底块）
3. **合同/印刷/单色黑白规则**：当应用场景为「文档、激光黑白打印、商务合同、发票」时，匹配 **单色纯黑版本 (Black)**：
   - 办公位图：`02_png/yuanqi_logo_black_office_2000.png`
   - 印刷 PDF：`05_print/yuanqi_logo_black_print_cmyk.pdf`
4. **小尺寸/独立图符规则**：当应用场景为「头像、图标、水印、小尺寸」时，匹配 **纯图标版 (Icon)**：
   - 矢量图符：`01_source/yuanqi_logo_icon_master.svg`
   - 1080px 通用高清头像：`03_avatar/yuanqi_logo_avatar_master_1080.png`
   - 网页 Favicon：`04_favicon/favicon.ico`
5. **商务名片/正式简洁规则**：当提到「名片、工牌、商务公函」时，优先提供精致分隔线排版或标准款：
   - 彩色印刷：`05_print/yuanqi_logo_color_print_cmyk.pdf`
   - 名片高清图：`02_png/yuanqi_logo_color_web_512.png`
6. **展会推广/画册宣讲规则**：当提到「展台横幅、招商画册、宣讲封面」时，优先提供带 Slogan 或完整横版：
   - 横版矢量母版：`01_source/yuanqi_logo_color_horizontal_master.svg`
   - 4000px 超清位图：`02_png/yuanqi_logo_color_hd_4000.png`

---

## 3. 资产目录索引与文件路径表

### (1) 01_source/ 矢量源文件母版
| 资产名称 | 格式 | 说明与推荐用途 |
| :--- | :--- | :--- |
| [yuanqi_logo_color_master.svg](./01_source/yuanqi_logo_color_master.svg) / [.pdf](./01_source/yuanqi_logo_color_master.pdf) | SVG / PDF | **【标准主款】** 品牌科技蓝标准中英文上下组合 |
| [yuanqi_logo_white_master.svg](./01_source/yuanqi_logo_white_master.svg) / [.pdf](./01_source/yuanqi_logo_white_master.pdf) | SVG / PDF | **【反白母版】** 纯白矢量图形与文字，深底专用 |
| [yuanqi_logo_black_master.svg](./01_source/yuanqi_logo_black_master.svg) / [.pdf](./01_source/yuanqi_logo_black_master.pdf) | SVG / PDF | **【单色黑母版】** 纯黑矢量，合同印章单色印刷专用 |
| [yuanqi_logo_icon_master.svg](./01_source/yuanqi_logo_icon_master.svg) / [.pdf](./01_source/yuanqi_logo_icon_master.pdf) | SVG / PDF | **【纯图标母版】** 去文字正方形构图，图标开发专用 |
| [yuanqi_logo_color_horizontal_master.svg](./01_source/yuanqi_logo_color_horizontal_master.svg) / [.pdf](./01_source/yuanqi_logo_color_horizontal_master.pdf) | SVG / PDF | **【完整横版】** 左右延展横版组合，官网头部与展板首选 |

### (2) 02_png/ 透明底高保真位图
| 文件路径 | 尺寸/规格 | 说明 |
| :--- | :--- | :--- |
| `02_png/yuanqi_logo_color_hd_4000.png` | 4000 × 4000 | 4K 印刷、大屏展示、超高清视频透明底 |
| `02_png/yuanqi_logo_white_hd_4000.png` | 4000 × 4000 | 反白款 4K 超高清透明底（无底色长方块） |
| `02_png/yuanqi_logo_black_hd_4000.png` | 4000 × 4000 | 纯黑款 4K 超高清透明底 |
| `02_png/yuanqi_logo_color_web_512.png` | 宽度 512 px | 官网头部、Web 端首选（等比高度，透明底） |
| `02_png/yuanqi_logo_color_web_256.png` | 宽度 256 px | 移动端 Web、普通网页导航栏 |
| `02_png/yuanqi_logo_white_web_512.png` | 宽度 512 px | 深色导航栏、暗黑模式 Web 页面 |
| `02_png/yuanqi_logo_color_office_2000.png`| 宽度 2000 px | PPT 演示、Word 报告封面内嵌（防模糊） |
| `02_png/yuanqi_logo_color_mail_300.png` | 宽度 300 px | 邮件签名专用（优化体积与清晰度平衡） |
| `02_png/yuanqi_logo_icon_apple_180.png` | 180 × 180 | iOS Web App / Safari 添加至主屏幕图标 |
| `02_png/yuanqi_logo_icon_android_192.png`| 192 × 192 | Android 应用市场标准图标（白底不透明） |
| `02_png/yuanqi_logo_icon_android_512.png`| 512 × 512 | Google Play / 应用商店详情页高分辨率图标 |

### (3) 03_avatar/ 全平台社交与自媒体适配
| 平台类别 | 头像文件 (Avatar) | 主页封面 / 背景横幅 (Cover) |
| :--- | :--- | :--- |
| **通用通吃** | `03_avatar/yuanqi_logo_avatar_master_1080.png` (1080×1080) | — |
| **微信公众号** | `03_avatar/yuanqi_logo_avatar_wechat_240.png` (240×240) | `03_avatar/yuanqi_logo_cover_wechat_900x383.png` (900×383) |
| **微信视频号** | `03_avatar/yuanqi_logo_avatar_channels_1080.png` (1080×1080) | `03_avatar/yuanqi_logo_cover_channels_1080x1260.png` (1080×1260) |
| **小红书** | `03_avatar/yuanqi_logo_avatar_xhs_400.png` (400×400) | `03_avatar/yuanqi_logo_cover_xhs_1000x800.png` (1000×800) |
| **抖音** | `03_avatar/yuanqi_logo_avatar_douyin_400.png` (400×400) | `03_avatar/yuanqi_logo_cover_douyin_1125x633.png` (1125×633) |
| **B 站** | `03_avatar/yuanqi_logo_avatar_bilibili_512.png` (512×512) | `03_avatar/yuanqi_logo_cover_bilibili_2560x400.png` (2560×400) |
| **知乎** | `03_avatar/yuanqi_logo_avatar_zhihu_400.png` (400×400) | `03_avatar/yuanqi_logo_cover_zhihu_2000x400.png` (2000×400) |
| **微博** | `03_avatar/yuanqi_logo_avatar_weibo_400.png` (400×400) | `03_avatar/yuanqi_logo_cover_weibo_1920x300.png` (1920×300) |
| **LinkedIn** | `03_avatar/yuanqi_logo_avatar_linkedin_300.png` (300×300) | `03_avatar/yuanqi_logo_cover_linkedin_1584x396.png` (1584×396) |
| **X (Twitter)** | `03_avatar/yuanqi_logo_avatar_x_400.png` (400×400) | `03_avatar/yuanqi_logo_cover_x_1500x500.png` (1500×500) |

### (4) 04_favicon/ 浏览器图标与多格式封装
- `04_favicon/favicon.ico`：标准 Windows 多分辨率封装 ICO 文件（内嵌 16×16、32×32、48×48 PNG 图像层）。
- `04_favicon/yuanqi_logo_favicon_16.png`、`yuanqi_logo_favicon_32.png`、`yuanqi_logo_favicon_48.png`、`yuanqi_logo_favicon_64.png`。

### (5) 05_print/ 印前 CMYK 专用文件与规格
- `05_print/yuanqi_logo_color_print_cmyk.pdf`：标准品牌蓝彩色版 CMYK 矢量 PDF。
- `05_print/yuanqi_logo_black_print_cmyk.pdf`：纯单色黑版 CMYK 矢量 PDF。
- `05_print/yuanqi_logo_white_print_cmyk.pdf`：深底反白版镂空印前矢量 PDF。
- `05_print/print_spec_bleed_3mm.txt`：详细出血与胶印技术指标。

---

## 4. 品牌色彩与排版参数

- **主色 (Tech Blue)**：HEX `#0E3183` | RGB `14, 49, 131` | CMYK `100, 80, 0, 20`
- **深黑 (Neutral Black)**：HEX `#141414` | RGB `20, 20, 20` | CMYK `0, 0, 0, 100`
- **反白 (Pure White)**：HEX `#FFFFFF` | RGB `255, 255, 255` | CMYK `0, 0, 0, 0`
- **深蓝黑底 (Dark Navy)**：HEX `#071846` | RGB `7, 24, 70` | CMYK `95, 85, 35, 50`
- **安全留白**：Logo 四周预留最小距离 $X \ge \frac{1}{4} H$（$H$ 为图标高度）。
- **极限尺寸**：横版宽度 $\ge 120\text{ px}$（印刷 $\ge 25\text{ mm}$）；纯图标 $\ge 16\text{ px}$。

---

## 5. 前端与界面集成代码示范

### HTML5 标准暗黑模式自适应集成：
```html
<picture>
  <!-- 深色模式自动切换为反白款 -->
  <source srcset="02_png/yuanqi_logo_white_web_512.png" media="(prefers-color-scheme: dark)">
  <!-- 浅色模式采用标准品牌蓝款 -->
  <img src="02_png/yuanqi_logo_color_web_512.png" alt="元企科技 YuanQee.AI" height="48">
</picture>
```

### Favicon 规范头部引用：
```html
<link rel="icon" type="image/x-icon" href="04_favicon/favicon.ico">
<link rel="icon" type="image/png" sizes="32x32" href="04_favicon/yuanqi_logo_favicon_32.png">
<link rel="apple-touch-icon" sizes="180x180" href="02_png/yuanqi_logo_icon_apple_180.png">
```
