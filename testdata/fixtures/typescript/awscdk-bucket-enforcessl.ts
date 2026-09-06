// aws-cdk-bucket-enforcessl: without enforceSSL a bucket answers plain HTTP
// and credentials cross the wire in the clear.
import { Bucket } from '@aws-cdk/aws-s3';

export function openStack(scope: any) {
  // ruleid: aws-cdk-bucket-enforcessl
  const a = new Bucket(scope, 'a');
  // ruleid: aws-cdk-bucket-enforcessl
  const b = new Bucket(scope, 'b', { versioned: true });
  // ok: aws-cdk-bucket-enforcessl
  const c = new Bucket(scope, 'c', { enforceSSL: true });
  // ok: aws-cdk-bucket-enforcessl
  const d = new Bucket(scope, 'd', { enforceSSL: true }, { versioned: true });
  return [a, b, c, d];
}
