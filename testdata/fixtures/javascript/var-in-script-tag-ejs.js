// EJS script-tag fixtures (regex over text)
// ruleid: var-in-script-tag
const t1 = '<script>var x = "<%= name %>";</script>';
// ruleid: var-in-script-tag
const t2 = '<script>var y = "<%= other %>";</script>';
// ok: var-in-script-tag
const s1 = '<script>var x = 1;</script>';
// ok: var-in-script-tag
const s2 = '<script src="/static/app.js"></script>';
// ok: var-in-script-tag
const s3 = '<span>no script</span>';
