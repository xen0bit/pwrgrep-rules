// awscdk-bucket-encryption: an unencrypted bucket keeps its objects in the
// clear. Set encryption to KMS_MANAGED or S3_MANAGED.
import { Bucket, BucketEncryption } from '@aws-cdk/aws-s3';

export function openStack(scope: any) {
  // ruleid: awscdk-bucket-encryption
  const a = new Bucket(scope, 'a');
  // ruleid: awscdk-bucket-encryption
  const b = new Bucket(scope, 'b', { versioned: true });
  // ok: awscdk-bucket-encryption
  const c = new Bucket(scope, 'c', { encryption: BucketEncryption.KMS_MANAGED });
  // ok: awscdk-bucket-encryption
  const d = new Bucket(scope, 'd', { encryption: BucketEncryption.S3_MANAGED });
  return [a, b, c, d];
}
