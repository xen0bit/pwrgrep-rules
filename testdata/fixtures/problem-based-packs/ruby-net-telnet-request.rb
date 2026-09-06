# CWE-319: Cleartext Transmission — Telnet
require 'net/telnet'
# ruleid: net-telnet-request
c = Net::Telnet::new("Host" => "example.com")
# ruleid: net-telnet-request
c2 = Net::Telnet::new("Host" => "192.168.1.1")
# ruleid: net-telnet-request
c3 = Net::Telnet::new("Host" => "10.0.0.1", "Port" => 23)
# ruleid: net-telnet-request
c4 = Net::Telnet::new("Host" => "telnet.example.com")
# ok: net-telnet-request
require 'net/ssh'
Net::SSH.start('example.com', 'user') do |ssh|
  ssh.exec!("ls")
end
# ok: net-telnet-request
require 'net/http'
Net::HTTP.get(URI('https://example.com'))
# ok: net-telnet-request
puts "using ssh not telnet"
