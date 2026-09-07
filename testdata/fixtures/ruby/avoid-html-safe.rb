def safe_index(name)
  # ruleid: avoid-html-safe
  name.html_safe
end

def safe_other(other)
  # ruleid: avoid-html-safe
  other.html_safe
end

def safe_interp(third)
  # ruleid: avoid-html-safe
  "hi #{third}".html_safe
end

def safe_plain
  # ok: avoid-html-safe
  'static'
end

def safe_escaped(name)
  # ok: avoid-html-safe
  h(name)
end

def safe_sanitize(dirty)
  # ok: avoid-html-safe
  sanitize(dirty)
end
