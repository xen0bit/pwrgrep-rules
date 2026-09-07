// awscdk-sqs-unencryptedqueue: an unencrypted queue keeps messages in the
// clear. Set encryption to KMS or KMS_MANAGED.
import { Queue, QueueEncryption } from '@aws-cdk/aws-sqs';

export function openStack(scope: any) {
  // ruleid: awscdk-sqs-unencryptedqueue
  const a = new Queue(scope, 'a');
  // ruleid: awscdk-sqs-unencryptedqueue
  const b = new Queue(scope, 'b', { visibilityTimeout: 30 });
  // ok: awscdk-sqs-unencryptedqueue
  const c = new Queue(scope, 'c', { encryption: QueueEncryption.KMS_MANAGED });
  // ok: awscdk-sqs-unencryptedqueue
  const d = new Queue(scope, 'd', { encryption: QueueEncryption.KMS });
  return [a, b, c, d];
}
