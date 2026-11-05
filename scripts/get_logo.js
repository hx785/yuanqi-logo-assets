#!/usr/bin/env node

/**
 * YuanQi Tech & yuanqee Robot School Logo Asset Locator CLI
 * Usage:
 *   node scripts/get_logo.js --brand school --scenario default --format png
 *   node scripts/get_logo.js --brand tech --scenario dark_mode --format svg
 *   node scripts/get_logo.js --scenario school_avatar
 *   node scripts/get_logo.js --scenario favicon
 */

const path = require('path');
const fs = require('fs');

const baseDir = path.resolve(__dirname, '..');

const assetMap = {
  tech: {
    default: {
      png: '02_png/yuanqi_logo_color_web_512.png',
      svg: '01_source/yuanqi_logo_color_master.svg',
      pdf: '01_source/yuanqi_logo_color_master.pdf',
      hd: '02_png/yuanqi_logo_color_hd_4000.png'
    },
    dark_mode: {
      png: '02_png/yuanqi_logo_white_web_512.png',
      svg: '01_source/yuanqi_logo_white_master.svg',
      pdf: '01_source/yuanqi_logo_white_master.pdf',
      hd: '02_png/yuanqi_logo_white_hd_4000.png'
    },
    print_black: {
      png: '02_png/yuanqi_logo_black_office_2000.png',
      svg: '01_source/yuanqi_logo_black_master.svg',
      pdf: '05_print/yuanqi_logo_black_print_cmyk.pdf',
      hd: '02_png/yuanqi_logo_black_hd_4000.png'
    },
    avatar: {
      png: '03_avatar/yuanqi_logo_avatar_master_1080.png',
      wechat: '03_avatar/yuanqi_logo_avatar_wechat_240.png',
      bilibili: '03_avatar/yuanqi_logo_avatar_bilibili_512.png',
      douyin: '03_avatar/yuanqi_logo_avatar_douyin_400.png',
      xhs: '03_avatar/yuanqi_logo_avatar_xhs_400.png',
      svg: '01_source/yuanqi_logo_icon_master.svg'
    },
    favicon: {
      ico: '04_favicon/favicon.ico',
      png: '04_favicon/yuanqi_logo_favicon_32.png',
      png16: '04_favicon/yuanqi_logo_favicon_16.png',
      png48: '04_favicon/yuanqi_logo_favicon_48.png'
    },
    banner: {
      horizontal_svg: '01_source/yuanqi_logo_color_horizontal_master.svg',
      horizontal_pdf: '01_source/yuanqi_logo_color_horizontal_master.pdf',
      wechat_cover: '03_avatar/yuanqi_logo_cover_wechat_900x383.png',
      bilibili_cover: '03_avatar/yuanqi_logo_cover_bilibili_2560x400.png',
      douyin_cover: '03_avatar/yuanqi_logo_cover_douyin_1125x633.png',
      xhs_cover: '03_avatar/yuanqi_logo_cover_xhs_1000x800.png'
    },
    app_icon: {
      apple: '02_png/yuanqi_logo_icon_apple_180.png',
      android: '02_png/yuanqi_logo_icon_android_192.png',
      android_hd: '02_png/yuanqi_logo_icon_android_512.png'
    }
  },
  school: {
    default: {
      png: '02_png/yuanqee_school_logo_color_web_512.png',
      svg: '01_source/yuanqee_school_logo_color_master.svg',
      pdf: '01_source/yuanqee_school_logo_color_master.pdf',
      hd: '02_png/yuanqee_school_logo_color_hd_4000.png'
    },
    dark_mode: {
      png: '02_png/yuanqee_school_logo_white_web_512.png',
      svg: '01_source/yuanqee_school_logo_white_master.svg',
      pdf: '01_source/yuanqee_school_logo_white_master.pdf',
      hd: '02_png/yuanqee_school_logo_white_hd_4000.png'
    },
    print_black: {
      png: '02_png/yuanqee_school_logo_black_office_2000.png',
      svg: '01_source/yuanqee_school_logo_black_master.svg',
      pdf: '05_print/yuanqee_school_logo_black_print_cmyk.pdf',
      hd: '02_png/yuanqee_school_logo_black_hd_4000.png'
    },
    avatar: {
      png: '03_avatar/yuanqee_school_logo_avatar_master_1080.png',
      wechat: '03_avatar/yuanqee_school_logo_avatar_wechat_240.png',
      bilibili: '03_avatar/yuanqee_school_logo_avatar_bilibili_512.png',
      douyin: '03_avatar/yuanqee_school_logo_avatar_douyin_400.png',
      xhs: '03_avatar/yuanqee_school_logo_avatar_xhs_400.png',
      svg: '01_source/yuanqee_school_logo_icon_master.svg'
    },
    favicon: {
      ico: '04_favicon/yuanqee_school_favicon.ico',
      png: '04_favicon/yuanqee_school_logo_favicon_32.png',
      png16: '04_favicon/yuanqee_school_logo_favicon_16.png',
      png48: '04_favicon/yuanqee_school_logo_favicon_48.png'
    },
    banner: {
      horizontal_svg: '01_source/yuanqee_school_logo_color_horizontal_master.svg',
      horizontal_pdf: '01_source/yuanqee_school_logo_color_horizontal_master.pdf',
      wechat_cover: '03_avatar/yuanqee_school_logo_cover_wechat_900x383.png',
      bilibili_cover: '03_avatar/yuanqee_school_logo_cover_bilibili_2560x400.png',
      douyin_cover: '03_avatar/yuanqee_school_logo_cover_douyin_1125x633.png',
      xhs_cover: '03_avatar/yuanqee_school_logo_cover_xhs_1000x800.png'
    },
    app_icon: {
      apple: '02_png/yuanqee_school_logo_icon_apple_180.png',
      android: '02_png/yuanqee_school_logo_icon_android_192.png',
      android_hd: '02_png/yuanqee_school_logo_icon_android_512.png'
    }
  }
};

function parseArgs() {
  const args = process.argv.slice(2);
  const options = { brand: 'tech', scenario: 'default', format: 'png', json: false };
  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--brand' && args[i + 1]) {
      options.brand = args[++i];
    } else if (args[i] === '--scenario' && args[i + 1]) {
      options.scenario = args[++i];
    } else if (args[i] === '--format' && args[i + 1]) {
      options.format = args[++i];
    } else if (args[i] === '--json') {
      options.json = true;
    }
  }
  // Auto-switch brand if scenario starts with school_
  if (options.scenario.startsWith('school_')) {
    options.brand = 'school';
    options.scenario = options.scenario.replace('school_', '');
  }
  return options;
}

const opts = parseArgs();
const brandAssets = assetMap[opts.brand] || assetMap.tech;
const scenarioData = brandAssets[opts.scenario] || brandAssets.default;
let relativePath = scenarioData[opts.format] || scenarioData.png || Object.values(scenarioData)[0];
const fullPath = path.join(baseDir, relativePath);

if (opts.json) {
  console.log(JSON.stringify({
    brand: opts.brand,
    scenario: opts.scenario,
    format: opts.format,
    relativePath: relativePath.replace(/\\/g, '/'),
    fullPath: fullPath.replace(/\\/g, '/'),
    exists: fs.existsSync(fullPath)
  }, null, 2));
} else {
  console.log(relativePath.replace(/\\/g, '/'));
}
