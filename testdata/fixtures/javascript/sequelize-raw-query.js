async function rawConcat(db, base, user) {
  // ruleid: sequelize-raw-query
  const sql = base + user;
  await db.sequelize.query(sql, {});
}

async function rawTemplate(db, user) {
  // ruleid: sequelize-raw-query
  await db.sequelize.query(`SELECT ${user}`, {});
}

async function rawConcatAgain(db, prefix, suffix) {
  // ruleid: sequelize-raw-query
  const sql = prefix + suffix;
  await db.sequelize.query(sql, {});
}

async function rawSafe(db, user) {
  // ok: sequelize-raw-query
  await db.sequelize.query('SELECT * FROM u WHERE name = ?', { replacements: [user] });
}

async function rawStatic(db) {
  // ok: sequelize-raw-query
  await db.sequelize.query('SELECT * FROM u', {});
}

async function plain(db, user) {
  // ok: sequelize-raw-query
  console.log(user);
}
