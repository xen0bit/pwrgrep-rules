// CWE-862: the route that knows who you are and not what you may do.
//
// Every route here carries an authentication middleware, so
// javascript-missing-auth has nothing to say about any of them. What separates
// them is whether a role is checked as well: the first three trust any account
// that can log in, and the last three name the role they need.
const express = require('express');
const app = express();
const router = express.Router();

// ruleid: javascript-862-rbac
app.get('/admin', authenticate, (req, res) => { res.send('secret'); });
// ruleid: javascript-862-rbac
app.post('/transfer', authMiddleware, (req, res) => { res.send('done'); });
// ruleid: javascript-862-rbac
router.get('/sensitive', requireAuth, (req, res) => { res.send('data'); });

// ok: javascript-862-rbac
app.get('/admin-safe', authenticate, requireRole('admin'), (req, res) => { res.send('secret'); });
// ok: javascript-862-rbac
router.post('/safe', requireAuth, hasPermission('write'), (req, res) => { res.send('ok'); });
// ok: javascript-862-rbac
app.get('/also-safe', authMiddleware, checkRole('editor'), (req, res) => { res.send('ok'); });

function authMiddleware(req, res, next) { next(); }
function requireAuth(req, res, next) { next(); }
function authenticate(req, res, next) { next(); }
