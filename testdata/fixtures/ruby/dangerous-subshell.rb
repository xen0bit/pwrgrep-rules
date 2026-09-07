# dangerous-subshell: interpolated backticks with user data.
val = params[:q]
# ruleid: dangerous-subshell
`ls #{val}`
# ruleid: dangerous-subshell
`echo #{params[:sort]}`
# ok: dangerous-subshell
`echo #{"static"}`
# ok: dangerous-subshell
`echo hi`
