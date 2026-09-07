// react-jwt-decoded-property: a decoded JWT payload was never verified, so
// trusting its fields (role, admin) is trusting the client.
import jwt_decode from 'jwt-decode';

export function roleOf(token: string): string {
  const decoded = jwt_decode(token);
  // ruleid: react-jwt-decoded-property
  return decoded.role;
}

export function isAdmin(token: string): boolean {
  const decoded = jwt_decode(token);
  // ruleid: react-jwt-decoded-property
  return decoded.isAdmin;
}

export function userId(token: string): string {
  const decoded = jwt_decode(token);
  // ruleid: react-jwt-decoded-property
  return decoded.sub;
}

// ok: react-jwt-decoded-property
export const version = '1.0';

// ok: react-jwt-decoded-property
export function constantRole(): string {
  return 'reader';
}
