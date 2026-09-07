require('playwright');

async function setHtml(page, html) {
  // ruleid: playwright-setcontent-injection
  await page.setContent(html);
}

async function setBody(page, body) {
  // ruleid: playwright-setcontent-injection
  await page.setContent(body);
}

async function setMarkup(page, markup) {
  // ruleid: playwright-setcontent-injection
  await page.setContent(markup);
}

async function setStatic(page) {
  // ok: playwright-setcontent-injection
  await page.setContent('<b>static</b>');
}

async function setConst(page) {
  // ok: playwright-setcontent-injection
  await page.setContent('<hr>');
}

async function plain(page) {
  // ok: playwright-setcontent-injection
  await page.close();
}
