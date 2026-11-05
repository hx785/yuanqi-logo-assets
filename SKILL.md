---
name: yuanqi-logo-assets
version: 1.1.0
author: YuanQi Tech
description: >-
  元企科技 (YuanQi Tech) 及旗下「yuanqee 机器人学校」官方 Logo 资产库与场景调用指南。当用户需要获取品牌 Logo 素材、在网页/应用/文档中嵌入 Logo、配置社交媒体（微信/抖音/B站/小红书/知乎/微博/LinkedIn/X）头像与头图、准备印刷品（名片/合同/易拉宝），或需要依据设计规范自动挑选最合适尺寸与配色的 Logo 资产时激活此 Skill。
inputs:
  - name: brand
    type: string
    required: false
    default: tech
    description: 品牌主体（tech: 元企科技, school: yuanqee 机器人学校）
  - name: scenario
    type: string
    required: false
    default: default
    description: 使用场景（default, dark_mode, print_black, avatar, favicon, banner, app_icon）
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

# 元企科技与机器人学校官方 Logo 资产库 (Skill)

本 Skill 封装了「元企科技 (YuanQi Tech)」及旗下「yuanqee 机器人学校」两套完整的官方 Logo 设计资产与印前交付物。涵盖矢量母版（SVG / PDF）、多尺寸透明底位图（PNG）、全平台社交媒体头图与头像、多分辨率 Favicon、CMYK 印刷文件以及严格的品牌视觉规范。
已原生适配 **Antigravity、Claude Code、OpenAI Codex、Tencent WorkBuddy、Cursor 及 Copilot**。

---

## 1. 资产全局概览

- **全局预览看板**：[contact_sheet.png](./contact_sheet.png)
- **极速使用指南**：[README.md](./README.md)
- **印前出血规范**：[05_print/print_spec_bleed_3mm.txt](./05_print/print_spec_bleed_3mm.txt)
- **辅助检索脚本**：[scripts/get_logo.js](./scripts/get_logo.js)

---

## 2. 场景匹配与决策规则 (Decision Rules)

智能体在接收到用户针对 Logo 的调用诉求时，按照以下决策流匹配输出资产：

```
                              ┌── 1. 判断品牌主体：
                              │    ├── 提到「学校 / 机器人学校 / 培训 / 教育」 ────> 【yuanqee 机器人学校】(`yuanqee_school_*`)
                              │    └── 提到「元企 / 科技 / 公司 / 默认」 ──────────> 【元企科技】(`yuanqi_*`)
                              │
                              ├── 2. 诉求为「头像 / 图标 / 水印 / 小尺寸 / Favicon」?
                              │    ├── Favicon 网页图标 ────> 04_favicon/yuanqee_school_favicon.ico 或 favicon.ico
                              │    ├── 移动端 App 图标 ─────> 02_png/*_icon_apple_180.png 或 *_icon_android_192.png
                              │    ├── 社交媒体通用头像 ────> 03_avatar/*_avatar_master_1080.png
                              │    └── 纯图标矢量母版 ──────> 01_source/*_icon_master.svg
                              │
                              └── 3. 配色体系判断：
                                   ├── 提到「深色背景、黑底、夜间模式、暗黑」 ──> 【反白白字版 (white)】
                                   ├── 提到「文档、单色印刷、合同、发票」 ──────> 【单色纯黑版 (black)】
                                   └── 默认/常规展示 ──────────────────────────> 【品牌彩色版 (color)】
```

### 核心规则速查清单：

1. **默认规则**：用户未明确指定配色时，默认输出彩色主款：
   - 元企科技：`02_png/yuanqi_logo_color_web_512.png` / `01_source/yuanqi_logo_color_master.svg`
   - 机器人学校：`02_png/yuanqee_school_logo_color_web_512.png` / `01_source/yuanqee_school_logo_color_master.svg`
2. **反白规则**：应用于深色底、夜景海报、深色导航栏：
   - 元企科技：`02_png/yuanqi_logo_white_web_512.png`（纯透明底，无白底块）
   - 机器人学校：`02_png/yuanqee_school_logo_white_web_512.png`（纯透明底）
3. **单色黑白规则**：合同文档、公函发票、单色激光打印：
   - 办公位图：`02_png/*_black_office_2000.png`
   - 印刷 PDF：`05_print/*_black_print_cmyk.pdf`
4. **纯图标与头像**：
   - 1080px 通用高清头像：`03_avatar/*_avatar_master_1080.png`
   - 网页 Favicon：`04_favicon/yuanqee_school_favicon.ico` 或 `favicon.ico`

---

## 3. 资产目录索引与文件路径表

### (1) 01_source/ 矢量源文件母版
| 资产类型 | 元企科技 (YuanQi Tech) | yuanqee 机器人学校 (Robot School) | 说明 |
| :--- | :--- | :--- | :--- |
| **彩色主款** | [yuanqi_logo_color_master.svg](./01_source/yuanqi_logo_color_master.svg) / [.pdf](./01_source/yuanqi_logo_color_master.pdf) | [yuanqee_school_logo_color_master.svg](./01_source/yuanqee_school_logo_color_master.svg) / [.pdf](./01_source/yuanqee_school_logo_color_master.pdf) | 标准彩色母版 |
| **反白款** | [yuanqi_logo_white_master.svg](./01_source/yuanqi_logo_white_master.svg) / [.pdf](./01_source/yuanqi_logo_white_master.pdf) | [yuanqee_school_logo_white_master.svg](./01_source/yuanqee_school_logo_white_master.svg) / [.pdf](./01_source/yuanqee_school_logo_white_master.pdf) | 深底专用纯白图形 |
| **单色黑款** | [yuanqi_logo_black_master.svg](./01_source/yuanqi_logo_black_master.svg) / [.pdf](./01_source/yuanqi_logo_black_master.pdf) | [yuanqee_school_logo_black_master.svg](./01_source/yuanqee_school_logo_black_master.svg) / [.pdf](./01_source/yuanqee_school_logo_black_master.pdf) | 合同与单色印刷 |
| **纯图标款** | [yuanqi_logo_icon_master.svg](./01_source/yuanqi_logo_icon_master.svg) / [.pdf](./01_source/yuanqi_logo_icon_master.pdf) | [yuanqee_school_logo_icon_master.svg](./01_source/yuanqee_school_logo_icon_master.svg) / [.pdf](./01_source/yuanqee_school_logo_icon_master.pdf) | 去文字正方图标母版 |
| **完整横版** | [yuanqi_logo_color_horizontal_master.svg](./01_source/yuanqi_logo_color_horizontal_master.svg) / [.pdf](./01_source/yuanqi_logo_color_horizontal_master.pdf) | [yuanqee_school_logo_color_horizontal_master.svg](./01_source/yuanqee_school_logo_color_horizontal_master.svg) / [.pdf](./01_source/yuanqee_school_logo_color_horizontal_master.pdf) | 左右横向延展排版 |

### (2) 02_png/ 透明底高保真位图
| 规格/尺寸 | 元企科技 (YuanQi Tech) | yuanqee 机器人学校 (Robot School) | 适用场景 |
| :--- | :--- | :--- | :--- |
| **4000px 彩色** | `02_png/yuanqi_logo_color_hd_4000.png` | `02_png/yuanqee_school_logo_color_hd_4000.png` | 4K 印刷、超清大屏 |
| **4000px 反白** | `02_png/yuanqi_logo_white_hd_4000.png` | `02_png/yuanqee_school_logo_white_hd_4000.png` | 深色底 4K 印刷 |
| **4000px 纯黑** | `02_png/yuanqi_logo_black_hd_4000.png` | `02_png/yuanqee_school_logo_black_hd_4000.png` | 单色 4K 印刷 |
| **2000px 彩色** | `02_png/yuanqi_logo_color_office_2000.png` | `02_png/yuanqee_school_logo_color_office_2000.png` | PPT 演讲、Word 封面 |
| **512px 彩色** | `02_png/yuanqi_logo_color_web_512.png` | `02_png/yuanqee_school_logo_color_web_512.png` | Web 官网头部首选 |
| **512px 反白** | `02_png/yuanqi_logo_white_web_512.png` | `02_png/yuanqee_school_logo_white_web_512.png` | 暗黑模式 Web 导航栏 |
| **256px 彩色** | `02_png/yuanqi_logo_color_web_256.png` | `02_png/yuanqee_school_logo_color_web_256.png` | 移动端网页、普通 Header |
| **300px / 200px** | `02_png/yuanqi_logo_color_mail_300.png` | `02_png/yuanqee_school_logo_color_mail_300.png` | 邮件签名专用 |
| **Apple 180px** | `02_png/yuanqi_logo_icon_apple_180.png` | `02_png/yuanqee_school_logo_icon_apple_180.png` | iOS Safari 主屏幕图标 |
| **Android 192px** | `02_png/yuanqi_logo_icon_android_192.png` | `02_png/yuanqee_school_logo_icon_android_192.png` | Android 标准应用图标 |
| **Android 512px** | `02_png/yuanqi_logo_icon_android_512.png` | `02_png/yuanqee_school_logo_icon_android_512.png` | 应用商店详情页高清图标 |

### (3) 03_avatar/ 全平台社交与自媒体适配
| 平台类别 | 元企科技头像 / 封面 | 机器人学校头像 / 封面 |
| :--- | :--- | :--- |
| **通用高清头像** | `03_avatar/yuanqi_logo_avatar_master_1080.png` | `03_avatar/yuanqee_school_logo_avatar_master_1080.png` |
| **微信公众号** | `yuanqi_logo_avatar_wechat_240.png`<br>`yuanqi_logo_cover_wechat_900x383.png` | `yuanqee_school_logo_avatar_wechat_240.png`<br>`yuanqee_school_logo_cover_wechat_900x383.png` |
| **微信次条封面** | `03_avatar/yuanqi_logo_cover_wechat_sub_200.png` | `03_avatar/yuanqee_school_logo_cover_wechat_sub_200.png` |
| **微信视频号** | `yuanqi_logo_avatar_channels_1080.png`<br>`yuanqi_logo_cover_channels_1080x1260.png` | `yuanqee_school_logo_avatar_channels_1080.png`<br>`yuanqee_school_logo_cover_channels_1080x1260.png` |
| **抖音** | `yuanqi_logo_avatar_douyin_400.png`<br>`yuanqi_logo_cover_douyin_1125x633.png` | `yuanqee_school_logo_avatar_douyin_400.png`<br>`yuanqee_school_logo_cover_douyin_1125x633.png` |
| **B 站** | `yuanqi_logo_avatar_bilibili_512.png`<br>`yuanqi_logo_cover_bilibili_2560x400.png` | `yuanqee_school_logo_avatar_bilibili_512.png`<br>`yuanqee_school_logo_cover_bilibili_2560x400.png` |
| **小红书** | `yuanqi_logo_avatar_xhs_400.png`<br>`yuanqi_logo_cover_xhs_1000x800.png` | `yuanqee_school_logo_avatar_xhs_400.png`<br>`yuanqee_school_logo_cover_xhs_1000x800.png` |
| **知乎** | `yuanqi_logo_avatar_zhihu_400.png`<br>`yuanqi_logo_cover_zhihu_2000x400.png` | `yuanqee_school_logo_avatar_zhihu_400.png`<br>`yuanqee_school_logo_cover_zhihu_2000x400.png` |
| **微博** | `yuanqi_logo_avatar_weibo_400.png`<br>`yuanqi_logo_cover_weibo_1920x300.png` | `yuanqee_school_logo_avatar_weibo_400.png`<br>`yuanqee_school_logo_cover_weibo_1920x300.png` |
| **LinkedIn** | `yuanqi_logo_avatar_linkedin_300.png`<br>`yuanqi_logo_cover_linkedin_1584x396.png` | `yuanqee_school_logo_avatar_linkedin_300.png`<br>`yuanqee_school_logo_cover_linkedin_1584x396.png` |
| **X (Twitter)** | `yuanqi_logo_avatar_x_400.png`<br>`yuanqi_logo_cover_x_1500x500.png` | `yuanqee_school_logo_avatar_x_400.png`<br>`yuanqee_school_logo_cover_x_1500x500.png` |

### (4) 04_favicon/ 浏览器图标
- `04_favicon/favicon.ico`（元企科技）与 `04_favicon/yuanqee_school_favicon.ico`（机器人学校）：均内嵌 16×16、32×32、48×48 PNG 图像层。
- 单尺寸 PNG：`*_favicon_16.png`、`*_favicon_32.png`、`*_favicon_48.png`、`*_favicon_64.png`。

### (5) 05_print/ 印前 CMYK 专用文件
- `yuanqi_logo_*_print_cmyk.pdf` & `yuanqee_school_logo_*_print_cmyk.pdf`（彩色、反白、纯黑、纯图标）。
- 印前指标与标准出血规范详见 [05_print/print_spec_bleed_3mm.txt](./05_print/print_spec_bleed_3mm.txt)。

---

## 4. 品牌色彩与排版参数

- **元企科技主色 (Tech Blue)**：HEX `#0E3183` | RGB `14, 49, 131` | CMYK `100, 80, 0, 20`
- **机器人学校活力橙 (School Orange)**：HEX `#EA5B18` | RGB `234, 91, 24` | CMYK `0, 75, 95, 0`
- **文字深黑 (Neutral Black)**：HEX `#141414` / `#000000` | RGB `20, 20, 20`
- **反白纯白 (Pure White)**：HEX `#FFFFFF` | RGB `255, 255, 255`
- **安全留白**：Logo 四周预留最小距离 $X \ge \frac{1}{4} H$（$H$ 为图标高度）。

---

## 5. 前端与界面集成示范

```html
<!-- 元企科技暗黑自适应 -->
<picture>
  <source srcset="02_png/yuanqi_logo_white_web_512.png" media="(prefers-color-scheme: dark)">
  <img src="02_png/yuanqi_logo_color_web_512.png" alt="元企科技" height="48">
</picture>

<!-- yuanqee 机器人学校 Favicon 引用 -->
<link rel="icon" type="image/x-icon" href="04_favicon/yuanqee_school_favicon.ico">
<link rel="icon" type="image/png" sizes="32x32" href="04_favicon/yuanqee_school_logo_favicon_32.png">
<link rel="apple-touch-icon" sizes="180x180" href="02_png/yuanqee_school_logo_icon_apple_180.png">
```
