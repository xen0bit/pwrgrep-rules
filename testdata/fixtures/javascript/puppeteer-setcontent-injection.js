require('puppeteer');

async function setHtml(page, html) {
  // ruleid: puppeteer-setcontent-injection
  await page.setContent(html);
}

async function setBody(page, body) {
  // ruleid: puppeteer-setcontent-injection
  await page.setContent(body);
}

async function setMarkup(page, markup) {
  // ruleid: puppeteer-setcontent-injection
  await page.setContent(markup);
}

async function setStatic(page) {
  // ok: puppeteer-setcontent-injection
  await page.setContent('<b>static</b>');
}

async function setConst(page) {
  // ok: puppeteer-setcontent-injection
  await page.setContent('<hr>');
}

async function plain(page) {
  // ok: puppeteer-setcontent-injection
  await page.close();
}
