// ruleid: avoid-v-html
const t1 = '<div v-html="user"></div>';
// ruleid: avoid-v-html
const t2 = '<span v-html="raw"></span>';
// ruleid: avoid-v-html
const t3 = '<p v-html="content"></p>';
// ok: avoid-v-html
const s1 = '<div>{{ user }}</div>';
// ok: avoid-v-html
const s2 = '<span v-text="user"></span>';
// ok: avoid-v-html
const s3 = '<p>static</p>';
