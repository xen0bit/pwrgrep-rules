const { Sequelize } = require('sequelize');

const vuln = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres',
  dialectOptions:
    // ruleid: sequelize-weak-tls-version
    { ssl: {
      minVersion: 'TLSv1'
    } }
});

const vulnAgain = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'mysql',
  dialectOptions:
    // ruleid: sequelize-weak-tls-version
    { ssl: {
      minVersion: 'TLSv1.1'
    } }
});

const vulnThird = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres',
  dialectOptions:
    // ruleid: sequelize-weak-tls-version
    { ssl: {
      minVersion: 'TLSv1'
    } }
});

// ok: sequelize-weak-tls-version
const safe = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres',
  dialectOptions:
    // ok: sequelize-weak-tls-version
    { ssl: {
      minVersion: 'TLSv1.2'
    } }
});

// ok: sequelize-weak-tls-version
const safeAgain = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres'
});

// ok: sequelize-weak-tls-version
const sqlite = new Sequelize({ dialect: 'sqlite' });
