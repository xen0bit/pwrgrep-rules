def eval_index
  user = params[:code]
  # ruleid: ruby-eval
  eval(user)

  q = params['q']
  # ruleid: ruby-eval
  eval(q)

  ck = cookies[:code]
  # ruleid: ruby-eval
  eval(ck)
end

def eval_safe
  # ok: ruby-eval
  eval('1+1')

  code = 'puts 1'
  # ok: ruby-eval
  eval(code)

  # ok: ruby-eval
  'eval in a string is not a call'
end
