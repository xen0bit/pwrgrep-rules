// ruleid: template-explicit-unescape
const t1 = 'p!= user';
// ruleid: template-explicit-unescape
const t2 = 'div!= html';
// ruleid: template-explicit-unescape
const t3 = 'p!{raw}';
// ok: template-explicit-unescape
const s1 = 'p= user';
// ok: template-explicit-unescape
const s2 = 'div #{escaped}';
// ok: template-explicit-unescape
const s3 = 'plain text';
