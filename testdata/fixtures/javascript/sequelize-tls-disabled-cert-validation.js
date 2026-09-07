const { Sequelize } = require('sequelize');

// ruleid: sequelize-tls-disabled-cert-validation
const vuln = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres',
  dialectOptions: {
    ssl: {
      rejectUnauthorized: false
    }
  }
});

// ruleid: sequelize-tls-disabled-cert-validation
const vulnAgain = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'mysql',
  dialectOptions: {
    ssl: {
      rejectUnauthorized: false
    }
  }
});

// ruleid: sequelize-tls-disabled-cert-validation
const vulnThird = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres',
  dialectOptions: {
    ssl: {
      rejectUnauthorized: false
    }
  }
});

// ok: sequelize-tls-disabled-cert-validation
const safe = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres',
  dialectOptions: {
    ssl: {
      rejectUnauthorized: true
    }
  }
});

// ok: sequelize-tls-disabled-cert-validation
const safeAgain = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres'
});

// ok: sequelize-tls-disabled-cert-validation
const sqlite = new Sequelize({ dialect: 'sqlite' });
