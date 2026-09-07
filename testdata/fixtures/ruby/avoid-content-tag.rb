def tag_index(name)
  # ruleid: avoid-content-tag
  content_tag(:p, name)
end

def tag_other(other)
  # ruleid: avoid-content-tag
  content_tag(:div, other)
end

def tag_third(third)
  # ruleid: avoid-content-tag
  content_tag(:span, third)
end

def tag_safe
  # ok: avoid-content-tag
  tag.p('static')
end

def tag_para(name)
  # ok: avoid-content-tag
  tag.p(name)
end

def tag_plain
  # ok: avoid-content-tag
  '<p>static</p>'
end
