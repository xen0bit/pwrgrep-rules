def erb_index(src)
  # ruleid: manual-template-creation
  ERB.new(src)
end

def erb_other(other)
  # ruleid: manual-template-creation
  ERB.new(other)
end

def erb_third(third)
  # ruleid: manual-template-creation
  ERB.new(third)
end

def erb_file(path)
  # ok: manual-template-creation
  File.read(path)
end

def erb_safe
  # ok: manual-template-creation
  'no template here'
end

def erb_plain
  # ok: manual-template-creation
  render :show
end
