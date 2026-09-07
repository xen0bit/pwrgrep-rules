// awscdk-bucket-grantpublicaccessmethod: grantPublicAccess makes the bucket's
// objects world-readable. Scope access with grantRead to a principal instead.
// The two statements must stand adjacent: the rule reads them as one sequence.
import { Bucket } from '@aws-cdk/aws-s3';

export function openStack(scope: any) {
  // ruleid: awscdk-bucket-grantpublicaccessmethod
  const a = new Bucket(scope, 'a');
  a.grantPublicAccess('*');
  // ruleid: awscdk-bucket-grantpublicaccessmethod
  const b = new Bucket(scope, 'b');
  b.grantPublicAccess('*', 'extra');
  // ok: awscdk-bucket-grantpublicaccessmethod
  const c = new Bucket(scope, 'c');
  c.grantRead(user);
  return [a, b, c];
}
declare const user: any;
