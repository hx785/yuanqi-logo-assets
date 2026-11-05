# AGENTS.md - YuanQi Tech Brand Assets Guide for Autonomous Agents

This document defines agent instructions and decision rules for OpenAI Codex, SWE-agent, Windsurf, WorkBuddy, and general agentic frameworks working with YuanQi Tech (元企科技) official brand assets.

---

## 1. Agent Behavior & Routing Rules

When a user request involves YuanQi Tech branding, web development, marketing materials, or document formatting, always select the appropriate asset based on the following deterministic rules:

1. **Default / General UI**:
   - Use `02_png/yuanqi_logo_color_web_512.png` for screen displays.
   - Use `01_source/yuanqi_logo_color_master.svg` for scalable responsive components.
2. **Dark Mode / Night Scenes / Dark Navy Backgrounds (`#071846`)**:
   - Use `02_png/yuanqi_logo_white_web_512.png` (verified transparent alpha channel, no white bounding box).
   - Use `01_source/yuanqi_logo_white_master.svg` for vector.
3. **Monochrome Print / Legal Contracts / Monochrome Invoices**:
   - Use `02_png/yuanqi_logo_black_office_2000.png` for documents.
   - Use `05_print/yuanqi_logo_black_print_cmyk.pdf` for offset/laser printing.
4. **Avatars / Favicons / App Icons / Watermarks**:
   - For website favicons: `04_favicon/favicon.ico`.
   - For square social avatars: `03_avatar/yuanqi_logo_avatar_master_1080.png`.
   - For iOS Web App: `02_png/yuanqi_logo_icon_apple_180.png`.
   - For Android store: `02_png/yuanqi_logo_icon_android_192.png`.
5. **Business Cards / Formal Letterheads**:
   - Use `05_print/yuanqi_logo_color_print_cmyk.pdf` with 3mm bleed support.
6. **Exhibition Banners / Company Profiles / Slogans**:
   - Use `01_source/yuanqi_logo_color_horizontal_master.svg` or `02_png/yuanqi_logo_color_hd_4000.png`.

---

## 2. Brand Colors Reference

```json
{
  "tech_blue": { "hex": "#0E3183", "rgb": [14, 49, 131], "cmyk": [100, 80, 0, 20] },
  "dark_navy":  { "hex": "#071846", "rgb": [7, 24, 70],   "cmyk": [95, 85, 35, 50] },
  "neutral_black": { "hex": "#141414", "rgb": [20, 20, 20], "cmyk": [0, 0, 0, 100] },
  "pure_white":    { "hex": "#FFFFFF", "rgb": [255, 255, 255], "cmyk": [0, 0, 0, 0] }
}
```

---

## 3. Helper Script

To deterministically retrieve an asset path programmatically, run:
```bash
node scripts/get_logo.js --scenario <scenario> --format <format>
```
Supported scenarios: `default`, `dark_mode`, `print_black`, `avatar`, `favicon`, `banner`, `card`.
Supported formats: `png`, `svg`, `pdf`, `ico`.
