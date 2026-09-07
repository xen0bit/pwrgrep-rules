require 'net/ftp'

def ftp_index
  host = params[:host]
  # ruleid: avoid-tainted-ftp-call
  Net::FTP.open(host)

  other = params['other']
  # ruleid: avoid-tainted-ftp-call
  Net::FTP.new(other)

  third = cookies[:host]
  # ruleid: avoid-tainted-ftp-call
  Net::FTP.open(third)
end

def ftp_safe
  # ok: avoid-tainted-ftp-call
  Net::FTP.open('ftp.example.com')

  # ok: avoid-tainted-ftp-call
  Net::FTP.new('ftp.example.com')

  # ok: avoid-tainted-ftp-call
  'open in a string is not a call'
end
