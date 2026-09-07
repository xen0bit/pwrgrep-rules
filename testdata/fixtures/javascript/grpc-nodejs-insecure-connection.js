const grpc = require('grpc');

function dialInsecure(addr) {
  // ruleid: grpc-nodejs-insecure-connection
  const creds = grpc.credentials.createInsecure();
  return new grpc.Client(addr, creds);
}

function dialAgain(host, port) {
  // ruleid: grpc-nodejs-insecure-connection
  const creds = grpc.credentials.createInsecure();
  return new grpc.Client(host + ':' + port, creds);
}

function dialSecure(addr, rootCerts) {
  // ok: grpc-nodejs-insecure-connection
  const creds = grpc.credentials.createSsl(rootCerts);
  return new grpc.Client(addr, creds);
}

function healthCheck(addr) {
  // ok: grpc-nodejs-insecure-connection
  return addr;
}
