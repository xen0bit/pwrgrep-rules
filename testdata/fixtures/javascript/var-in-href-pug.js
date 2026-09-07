// ruleid: var-in-href
const t1 = 'a(href=user)';
// ruleid: var-in-href
const t2 = 'a(class=x, href=url)';
// ruleid: var-in-href
const t3 = 'a(href=profile) link';
// ok: var-in-href
const s1 = "a(href='/static')";
// ok: var-in-href
const s2 = 'a(href="https://example.com")';
// ok: var-in-href
const s3 = 'span text';
