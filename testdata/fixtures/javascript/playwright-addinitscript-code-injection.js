require('playwright');

async function addScript(context, script) {
  // ruleid: playwright-addinitscript-code-injection
  await context.addInitScript(script);
}

async function addScriptAgain(context, code) {
  // ruleid: playwright-addinitscript-code-injection
  await context.addInitScript(code);
}

async function addScriptThird(context, init) {
  // ruleid: playwright-addinitscript-code-injection
  await context.addInitScript(init);
}

async function addStatic(context) {
  // ok: playwright-addinitscript-code-injection
  await context.addInitScript('console.log(1)');
}

async function addFn(context) {
  // ok: playwright-addinitscript-code-injection
  await context.addInitScript(function() { return 1; });
}

async function plain(context) {
  // ok: playwright-addinitscript-code-injection
  await context.close();
}
