def send_index
  m = params[:method]
  # ruleid: bad-send
  res = obj.send(m.foo)
  n = params[:other]
  # ruleid: bad-send
  res2 = obj.public_send(n.bar)
  p = params[:third]
  # ruleid: bad-send
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
