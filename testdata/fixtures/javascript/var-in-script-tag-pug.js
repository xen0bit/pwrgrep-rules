// Pug script-tag fixtures (regex over text)
// ruleid: var-in-script-tag
const t1 = 'script= userName';
// ruleid: var-in-script-tag
const t2 = 'script(type="text/javascript")= userCode';
// ok: var-in-script-tag
const s1 = 'script(src="app.js")';
// ok: var-in-script-tag
const s2 = 'div content';
// ok: var-in-script-tag
const s3 = 'script= "static"';
