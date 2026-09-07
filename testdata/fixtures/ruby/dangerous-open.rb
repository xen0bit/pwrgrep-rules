def open_index
  name = params[:file]
  # ruleid: dangerous-open
  open(name, 'r')

  other = params['other']
  # ruleid: dangerous-open
  open(other)

  third = cookies[:file]
  # ruleid: dangerous-open
  open(third, 'r')
end

def open_safe
  # ok: dangerous-open
  open('static.txt', 'r')

  # ok: dangerous-open
  open('other.txt')

  # ok: dangerous-open
  'open in a string is not a call'
end
