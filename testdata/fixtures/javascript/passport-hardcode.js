const passport = require('passport');
const JwtStrategy = require('passport-jwt').Strategy;

function setupAuth() {
  const opts = {};
  // ruleid: hardcoded-passport-secret
  opts.secretOrKey = 'hardcoded-secret';
  passport.use(new JwtStrategy(opts, function (jwt, done) {
    return done(null, jwt);
  }));
}

function setupAgain() {
  // ruleid: hardcoded-passport-secret
  passport.use(new JwtStrategy({secretOrKey: 'another-secret'}, function (jwt, done) {
    return done(null, jwt);
  }));
}

function setupEnv() {
  // ok: hardcoded-passport-secret
  passport.use(new JwtStrategy({secretOrKey: process.env.SECRET}, function (jwt, done) {
    return done(null, jwt);
  }));
}

function setupNone() {
  // ok: hardcoded-passport-secret
  passport.use(new JwtStrategy({}, function (jwt, done) {
    return done(null, jwt);
  }));
}
