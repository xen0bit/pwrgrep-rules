const pw = require('playwright');

async function debugIt() {
  // ruleid: playwright-exposed-chrome-devtools
  const browser = await pw.chromium.launch({args: ['--remote-debugging-port=9222']});
  return browser;
}

async function debugAgain() {
  // ruleid: playwright-exposed-chrome-devtools
  const browser = await pw.chromium.launch({args: ['--remote-debugging-address=127.0.0.1']});
  return browser;
}

async function headless() {
  // ok: playwright-exposed-chrome-devtools
  const browser = await pw.chromium.launch({headless: true});
  return browser;
}

async function version() {
  // ok: playwright-exposed-chrome-devtools
  return pw.chromium.version;
}
