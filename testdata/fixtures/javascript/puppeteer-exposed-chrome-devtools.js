const puppeteer = require('puppeteer');

async function debugIt() {
  // ruleid: puppeteer-exposed-chrome-devtools
  const browser = await puppeteer.launch({args: ['--remote-debugging-port=9222']});
  return browser;
}

async function debugAgain() {
  // ruleid: puppeteer-exposed-chrome-devtools
  const browser = await puppeteer.launch({args: ['--remote-debugging-address=127.0.0.1']});
  return browser;
}

async function headless() {
  // ok: puppeteer-exposed-chrome-devtools
  const browser = await puppeteer.launch({headless: true});
  return browser;
}

async function version() {
  // ok: puppeteer-exposed-chrome-devtools
  return puppeteer.version;
}
