// EJS script-src fixtures (regex over text)
// ruleid: var-in-script-src
const t1 = '<script src="<%= userSrc %>"></script>';
// ruleid: var-in-script-src
const t2 = "<script src='<%= otherSrc %>'></script>";
// ok: var-in-script-src
const s1 = '<script src="/static/app.js"></script>';
// ok: var-in-script-src
const s2 = '<script>var x = 1;</script>';
// ok: var-in-script-src
const s3 = '<span>no script</span>';
