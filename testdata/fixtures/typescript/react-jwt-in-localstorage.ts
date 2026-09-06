// react-jwt-in-localstorage: localStorage is readable by any script on the
// page, so a JWT kept there leaks with the first XSS. Keep tokens in an
// httpOnly cookie instead. The decode and the store must stand adjacent:
// the rule reads the two statements as one sequence, and the annotation
// marks the decode line where the finding lands.
import jwt_decode from 'jwt-decode';

export function login(token: string): void {
  // ruleid: react-jwt-in-localstorage
  const decoded = jwt_decode(token);
  localStorage.setItem('token', token);
}

export function refresh(token: string): void {
  // ruleid: react-jwt-in-localstorage
  const copy = jwt_decode(token);
  localStorage.setItem('refresh', copy);
}

// ok: react-jwt-in-localstorage
export function logout(): void {
  localStorage.removeItem('token');
}

// ok: react-jwt-in-localstorage
export function theme(name: string): void {
  localStorage.setItem('theme', name);
}
