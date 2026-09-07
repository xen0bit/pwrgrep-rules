require('playwright');

async function runArg(page, user) {
  // ruleid: playwright-evaluate-arg-injection
  await page.evaluate((x) => document.title = x, user);
}

async function runArgAgain(page, data) {
  // ruleid: playwright-evaluate-arg-injection
  await page.evaluate((x) => x, data);
}

async function runArgThird(page, value) {
  // ruleid: playwright-evaluate-arg-injection
  await page.evaluate((v) => console.log(v), value);
}

async function runStatic(page) {
  // ok: playwright-evaluate-arg-injection
  await page.evaluate('1+1');
}

async function runFn(page) {
  // ok: playwright-evaluate-arg-injection
  await page.evaluate(function() { return 1; });
}

async function plain(page) {
  // ok: playwright-evaluate-arg-injection
  await page.goto('https://example.com');
}
