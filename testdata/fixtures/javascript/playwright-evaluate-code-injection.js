require('playwright');

async function runEval(page, script) {
  // ruleid: playwright-evaluate-code-injection
  await page.evaluate(script);
}

async function runEvalAgain(page, code) {
  // ruleid: playwright-evaluate-code-injection
  await page.evaluate(code);
}

async function runHandle(page, fn) {
  // ruleid: playwright-evaluate-code-injection
  await page.evaluateHandle(fn);
}

async function runStatic(page) {
  // ok: playwright-evaluate-code-injection
  await page.evaluate('1+1');
}

async function runFn(page) {
  // ok: playwright-evaluate-code-injection
  await page.evaluate(function() { return 1; });
}

async function plain(page) {
  // ok: playwright-evaluate-code-injection
  await page.goto('https://example.com');
}
