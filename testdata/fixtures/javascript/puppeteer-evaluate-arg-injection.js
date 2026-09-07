require('puppeteer');

async function runArg(page, user) {
  // ruleid: puppeteer-evaluate-arg-injection
  await page.evaluate((x) => document.title = x, user);
}

async function runArgAgain(page, data) {
  // ruleid: puppeteer-evaluate-arg-injection
  await page.evaluate((x) => x, data);
}

async function runArgThird(page, value) {
  // ruleid: puppeteer-evaluate-arg-injection
  await page.evaluate((v) => console.log(v), value);
}

async function runStatic(page) {
  // ok: puppeteer-evaluate-arg-injection
  await page.evaluate('1+1');
}

async function runFn(page) {
  // ok: puppeteer-evaluate-arg-injection
  await page.evaluate(function() { return 1; });
}

async function plain(page) {
  // ok: puppeteer-evaluate-arg-injection
  await page.goto('https://example.com');
}
