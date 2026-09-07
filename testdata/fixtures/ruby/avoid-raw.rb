def raw_index(name)
  # ruleid: avoid-raw
  raw(name)
end

def raw_other(other)
  # ruleid: avoid-raw
  raw(other)
end

def raw_third(third)
  # ruleid: avoid-raw
  raw(third)
end

def raw_safe
  # ok: avoid-raw
  'static'
end

def raw_safe_two(name)
  # ok: avoid-raw
  h(name)
end

def raw_safe_three
  # ok: avoid-raw
  sanitize('<b>hi</b>')
end
