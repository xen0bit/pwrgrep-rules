const Ajv = require('ajv');

function checkAllErrors(userSchema) {
  // ruleid: ajv-allerrors-true
  const ajv1 = new Ajv({allErrors: true});
  // ruleid: ajv-allerrors-true
  const ajv2 = new Ajv({allErrors: true, verbose: true});
}

function checkViaSettings() {
  // ruleid: ajv-allerrors-true
  const ajv3 = new Ajv({allErrors: true, strict: false});
}

function safeStrict() {
  // ok: ajv-allerrors-true
  const ajv4 = new Ajv({allErrors: false});
  // ok: ajv-allerrors-true
  const ajv5 = new Ajv({});
  // ok: ajv-allerrors-true
  const ajv6 = new Ajv({verbose: true});
}
