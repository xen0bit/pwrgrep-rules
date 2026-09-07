// ruleid: template-and-attributes
const t1 = 'div&attributes(attrs)';
// ruleid: template-and-attributes
const t2 = 'a&attributes(link)';
// ruleid: template-and-attributes
const t3 = 'span&attributes(opts)';
// ok: template-and-attributes
const s1 = 'div(class="static")';
// ok: template-and-attributes
const s2 = 'a(href="/home")';
// ok: template-and-attributes
const s3 = 'plain text line';
