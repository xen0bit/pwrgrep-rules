# CWE-319: Cleartext Transmission — FTP
require 'net/ftp'
# ruleid: net-ftp-request
ftp = Net::FTP.new('example.com')
ftp.login
# ruleid: net-ftp-request
ftp2 = Net::FTP.new('ftp.example.com')
ftp2.login
# ruleid: net-ftp-request
ftp3 = Net::FTP.new('ftp3.example.com')
ftp3.login
# ruleid: net-ftp-request
Net::FTP.open('ftp4.example.com') do |ftp|
  ftp.login
end
# ok: net-ftp-request
require 'net/sftp'
Net::SFTP.start('example.com', 'user') do |sftp|
  sftp.upload!('/local', '/remote')
end
# ok: net-ftp-request
require 'net/http'
uri = URI('https://example.com')
Net::HTTP.get(uri)
# ok: net-ftp-request
puts "using sftp not ftp"
