def deser_env
  blob = request.env['blob']
  # ruleid: bad-deserialization-env
  Marshal.load(blob)

  other = request.env['other']
  # ruleid: bad-deserialization-env
  Oj.load(other)

  third = request.env['third']
  # ruleid: bad-deserialization-env
  CSV.load(third)
end

def deser_env_safe
  # ok: bad-deserialization-env
  Marshal.load(File.read('static.bin'))

  # ok: bad-deserialization-env
  Oj.load('{"a":1}')

  # ok: bad-deserialization-env
  Marshal.dump({ a: 1 })
end
