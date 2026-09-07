require('puppeteer');

async function goTo(page, url) {
  // ruleid: puppeteer-goto-injection
  await page.goto(url);
}

async function goToAgain(page, dest) {
  // ruleid: puppeteer-goto-injection
  await page.goto(dest);
}

async function goToThird(page, target) {
  // ruleid: puppeteer-goto-injection
  await page.goto(target);
}

async function goStatic(page) {
  // ok: puppeteer-goto-injection
  await page.goto('https://example.com');
}

async function goConst(page) {
  // ok: puppeteer-goto-injection
  await page.goto('https://example.com/home');
}

async function plain(page) {
  // ok: puppeteer-goto-injection
  await page.close();
}
