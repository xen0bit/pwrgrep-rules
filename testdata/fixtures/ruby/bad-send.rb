def send_index
  # ruleid: bad-send
  m = params[:method]
  res = obj.send(m.foo)
  # ruleid: bad-send
  n = params[:other]
  res2 = obj.public_send(n.bar)
  # ruleid: bad-send
  p = params[:third]
  res3 = obj.try(p.baz)
end

def send_safe
  # ok: bad-send
  res = obj.send(:fixed)
  # ok: bad-send
  res2 = obj.public_send('fixed')
  # ok: bad-send
  'send in a string is not a call'
end
