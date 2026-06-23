import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const { chromium } = require('/Users/vivekr_500340/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/playwright');

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const htmlPath = path.join(__dirname, 'index.html');
const pdfPath = path.join(__dirname, 'ctrl-shift-ai-ep01-ai-adoption-curve.pdf');
const pagesDir = path.join(__dirname, 'pages');

const browser = await chromium.launch({ headless: true });
const page = await browser.newPage({
  viewport: { width: 1080, height: 1080 },
  deviceScaleFactor: 1,
});

await page.goto(`file://${htmlPath}`, { waitUntil: 'networkidle' });
await page.emulateMedia({ media: 'screen' });

const slides = await page.locator('.slide').count();
for (let i = 0; i < slides; i += 1) {
  await page.locator('.slide').nth(i).screenshot({
    path: path.join(pagesDir, `slide-${String(i + 1).padStart(2, '0')}.png`),
  });
}

await page.emulateMedia({ media: 'print' });
await page.pdf({
  path: pdfPath,
  printBackground: true,
  preferCSSPageSize: true,
  width: '1080px',
  height: '1080px',
  margin: { top: 0, right: 0, bottom: 0, left: 0 },
});

await browser.close();

console.log(JSON.stringify({ pdfPath, slides }, null, 2));
