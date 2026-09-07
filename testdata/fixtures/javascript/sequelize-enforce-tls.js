const { Sequelize } = require('sequelize');

// ruleid: sequelize-enforce-tls
const vuln = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres'
});

// ruleid: sequelize-enforce-tls
const vulnAgain = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'mysql'
});

// ruleid: sequelize-enforce-tls
const vulnThird = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres'
});

// ok: sequelize-enforce-tls
const safe = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres',
  dialectOptions: {
      ssl: true
  }
});

// ok: sequelize-enforce-tls
const safeAgain = new Sequelize({
  host: 'db.example.com',
  database: 'app',
  dialect: 'postgres',
  dialectOptions: {
    ssl: { require: true }
  }
});

// ok: sequelize-enforce-tls
const sqlite = new Sequelize({ dialect: 'sqlite' });
