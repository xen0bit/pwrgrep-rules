// EJS var-in-href fixtures (regex over text)
// ruleid: var-in-href
const t1 = '<a href="<%= user %>">';
// ruleid: var-in-href
const t2 = '<a class="x" href="<%= url %>">';
// ruleid: var-in-href
const t3 = '<a href="<%= profile %>">link</a>';
// ok: var-in-href
const s1 = '<a href="/static">static</a>';
// ok: var-in-href
const s2 = '<a href="https://example.com">ex</a>';
// ok: var-in-href
const s3 = '<span>no anchor</span>';
