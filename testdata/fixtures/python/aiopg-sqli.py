# aiopg executes whatever string it is handed: formatting values in
# re-parses them as SQL. Flag concatenated/formatted queries;
# bound parameters keep code and data apart.
import aiopg


async def flag_concat(user):
    conn = await aiopg.connect(dsn)
    cur = await conn.cursor()
    # ruleid: aiopg-sqli
    await cur.execute('SELECT * FROM users WHERE name=' + user)
    # ruleid: aiopg-sqli
    await cur.execute('SELECT * FROM users WHERE name=%s' % user)
    # ruleid: aiopg-sqli
    await cur.execute('SELECT * FROM users WHERE name={}'.format(user))


async def safe_bound(user):
    conn = await aiopg.connect(dsn)
    cur = await conn.cursor()
    # ok: aiopg-sqli
    await cur.execute('SELECT * FROM users WHERE name=%s', (user,))
    # ok: aiopg-sqli
    await cur.execute('SELECT * FROM users WHERE name=%(name)s', {"name": user})
    # ok: aiopg-sqli
    await cur.execute('SELECT * FROM users')
