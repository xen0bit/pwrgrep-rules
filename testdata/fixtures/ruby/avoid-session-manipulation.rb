def session_index
  # ruleid: avoid-session-manipulation
  session[params[:key]] = 1

  # ruleid: avoid-session-manipulation
  session[cookies[:key]] = 2

  # ruleid: avoid-session-manipulation
  session[request.env['key']] = 3
end

def session_safe
  # ok: avoid-session-manipulation
  session[:fixed] = 1

  # ok: avoid-session-manipulation
  session['static'] = 2

  # ok: avoid-session-manipulation
  user = session[:user]
end
