# AGENTS.md - YuanQi Tech & Robot School Brand Assets Guide for Autonomous Agents

This document defines agent instructions and decision rules for OpenAI Codex, SWE-agent, Windsurf, WorkBuddy, and general agentic frameworks working with YuanQi Tech (元企科技) and yuanqee Robot School (yuanqee 机器人学校) official brand assets.

---

## 1. Agent Behavior & Routing Rules

When a user request involves branding, web development, marketing materials, or document formatting, always select the appropriate asset based on the brand entity and scenario:

1. **Brand Entity Routing**:
   - If user mentions "学校", "机器人学校", "培训", "教育", or "school" -> Target **yuanqee Robot School** (`yuanqee_school_*`).
   - Otherwise -> Default to **YuanQi Tech** (`yuanqi_*`).

2. **Default / General UI**:
   - Tech: `02_png/yuanqi_logo_color_web_512.png` / `01_source/yuanqi_logo_color_master.svg`
   - School: `02_png/yuanqee_school_logo_color_web_512.png` / `01_source/yuanqee_school_logo_color_master.svg`

3. **Dark Mode / Night Scenes / Dark Backgrounds**:
   - Tech: `02_png/yuanqi_logo_white_web_512.png` (verified transparent alpha channel, no white bounding box)
   - School: `02_png/yuanqee_school_logo_white_web_512.png` (verified transparent alpha channel)

4. **Monochrome Print / Legal Contracts / Monochrome Invoices**:
   - Office/Doc: `02_png/*_black_office_2000.png`
   - Print CMYK: `05_print/*_black_print_cmyk.pdf`

5. **Avatars / Favicons / App Icons**:
   - Favicon: `04_favicon/yuanqee_school_favicon.ico` or `04_favicon/favicon.ico`
   - Square Avatar: `03_avatar/*_avatar_master_1080.png`
   - iOS Web App Icon: `02_png/*_icon_apple_180.png`
   - Android Store: `02_png/*_icon_android_192.png`

6. **Banners / Slogans / Exhibition Boards**:
   - Horizontal Master: `01_source/*_color_horizontal_master.svg`
   - 4K High-Res: `02_png/*_color_hd_4000.png`

---

## 2. Brand Colors Reference

```json
{
  "tech_blue":     { "hex": "#0E3183", "rgb": [14, 49, 131],  "cmyk": [100, 80, 0, 20] },
  "school_orange": { "hex": "#EA5B18", "rgb": [234, 91, 24],  "cmyk": [0, 75, 95, 0] },
  "neutral_black": { "hex": "#141414", "rgb": [20, 20, 20],   "cmyk": [0, 0, 0, 100] },
  "pure_white":    { "hex": "#FFFFFF", "rgb": [255, 255, 255], "cmyk": [0, 0, 0, 0] }
}
```

---

## 3. Helper Script

To deterministically retrieve an asset path programmatically, run:
```bash
node scripts/get_logo.js --brand <tech|school> --scenario <scenario> --format <format>
```
