def file_index
  # ruleid: check-send-file
  send_file(params[:file])
end

def file_other
  # ruleid: check-send-file
  send_file(params['other'])
end

def file_third
  # ruleid: check-send-file
  send_file(cookies[:file])
end

def file_safe
  # ok: check-send-file
  send_file('static.txt')
end

def file_const
  # ok: check-send-file
  send_file('/var/app/static.txt')
end

def file_plain(path)
  # ok: check-send-file
  send_file(path)
end
