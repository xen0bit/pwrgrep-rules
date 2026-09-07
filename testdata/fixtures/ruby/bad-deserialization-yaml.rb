def yaml_index
  doc = params[:doc]
  # ruleid: bad-deserialization-yaml
  YAML.load(doc)

  other = params['other']
  # ruleid: bad-deserialization-yaml
  YAML.load(other)

  third = cookies[:doc]
  # ruleid: bad-deserialization-yaml
  YAML.load(third)
end

def yaml_safe
  # ok: bad-deserialization-yaml
  YAML.load(File.read('static.yml'))

  # ok: bad-deserialization-yaml
  YAML.load('static', safe: true)

  # ok: bad-deserialization-yaml
  YAML.load('{"a":1}')
end
