// CWE-287: Improper Authentication — Express app.get without authenticate
const express = require('express');
const app = express();
const router = express.Router();

function authenticate(req,res,next){ next(); }
function authMiddleware(req,res,next){ next(); }
function requireAuth(req,res,next){ next(); }

// ruleid: javascript-missing-auth
app.get('/admin', (req, res) => { res.send('secret'); });
// ruleid: javascript-missing-auth
app.post('/transfer', (req, res) => { res.send('done'); });
// ruleid: javascript-missing-auth
router.get('/sensitive', (req, res) => { res.send('data'); });

// ok: javascript-missing-auth
app.get('/admin-safe', authenticate, (req, res) => { res.send('secret'); });
// ok: javascript-missing-auth
router.post('/safe', authMiddleware, (req, res) => { res.send('ok'); });
