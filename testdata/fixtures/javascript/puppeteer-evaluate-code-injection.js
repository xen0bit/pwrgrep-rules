require('puppeteer');

async function runEval(page, script) {
  // ruleid: puppeteer-evaluate-code-injection
  await page.evaluate(script);
}

async function runEvalAgain(page, code) {
  // ruleid: puppeteer-evaluate-code-injection
  await page.evaluate(code);
}

async function runHandle(page, fn) {
  // ruleid: puppeteer-evaluate-code-injection
  await page.evaluateHandle(fn);
}

async function runStatic(page) {
  // ok: puppeteer-evaluate-code-injection
  await page.evaluate('1+1');
}

async function runFn(page) {
  // ok: puppeteer-evaluate-code-injection
  await page.evaluate(function() { return 1; });
}

async function plain(page) {
  // ok: puppeteer-evaluate-code-injection
  await page.goto('https://example.com');
}
