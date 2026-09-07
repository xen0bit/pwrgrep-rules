require('playwright');

async function goTo(page, url) {
  // ruleid: playwright-goto-injection
  await page.goto(url);
}

async function goToAgain(page, dest) {
  // ruleid: playwright-goto-injection
  await page.goto(dest);
}

async function goToThird(page, target) {
  // ruleid: playwright-goto-injection
  await page.goto(target);
}

async function goStatic(page) {
  // ok: playwright-goto-injection
  await page.goto('https://example.com');
}

async function goConst(page) {
  // ok: playwright-goto-injection
  await page.goto('https://example.com/home');
}

async function plain(page) {
  // ok: playwright-goto-injection
  await page.close();
}
