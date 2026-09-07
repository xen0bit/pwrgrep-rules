require 'oj'

def deser_index
  blob = params[:blob]
  # ruleid: bad-deserialization
  Marshal.load(blob)

  other = params['other']
  # ruleid: bad-deserialization
  Oj.load(other)

  third = cookies[:blob]
  # ruleid: bad-deserialization
  CSV.load(third)
end

def deser_safe
  # ok: bad-deserialization
  Marshal.load(File.read('static.bin'))

  # ok: bad-deserialization
  Oj.load('{"a":1}')

  # ok: bad-deserialization
  Marshal.dump({ a: 1 })
end
