// CWE-319: Cleartext FTP without secure
ftp = require('ftp');
c = new ftp();
opts = {host: "example.com"};
// ruleid: ftp-request
c.connect(opts);
ftp2 = require('ftp');
c2 = new ftp2();
opts2 = {host: "ftp.example.com"};
// ruleid: ftp-request
c2.connect(opts2);
ftp3 = require('ftp');
c3 = new ftp3();
// ruleid: ftp-request
c3.connect({host: "ftp3.example.com"});
ftp4 = require('ftp');
c4 = new ftp4();
// ruleid: ftp-request
c4.connect({host: "ftp4.example.com", port: 21});
// ok: ftp-request
cSafe = new ftp();
cSafe.connect({host: "example.com", secure: true});
// ok: ftp-request
cSafe2 = new ftp();
cSafe2.connect({secure: true});
// ok: ftp-request
let secureNote = "ftp replaced with sftp secure:true";
