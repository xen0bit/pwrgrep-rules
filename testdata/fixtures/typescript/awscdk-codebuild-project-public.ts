// awscdk-codebuild-project-public: badge: true publishes the build status to
// a public URL. Drop the badge or keep the project private.
import { Project } from '@aws-cdk/aws-codebuild';

export function openStack(scope: any) {
  // ruleid: awscdk-codebuild-project-public
  const a = new Project(scope, 'a', { badge: true });
  // ruleid: awscdk-codebuild-project-public
  const b = new Project(scope, 'b', { badge: true, description: 'x' });
  // ok: awscdk-codebuild-project-public
  const c = new Project(scope, 'c', { badge: false });
  // ok: awscdk-codebuild-project-public
  const d = new Project(scope, 'd', { description: 'x' });
  return [a, b, c, d];
}
