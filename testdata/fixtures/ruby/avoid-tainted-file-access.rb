def file_index
  name = params[:file]
  # ruleid: avoid-tainted-file-access
  File.read(name)

  other = params['other']
  # ruleid: avoid-tainted-file-access
  File.open(other)

  third = cookies[:file]
  # ruleid: avoid-tainted-file-access
  Dir.entries(third)
end

def file_safe
  # ok: avoid-tainted-file-access
  File.read('static.txt')

  # ok: avoid-tainted-file-access
  File.open('other.txt')

  # ok: avoid-tainted-file-access
  Dir.entries('/tmp')
end
