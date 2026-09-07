# asyncpg executes whatever string it is handed: formatting values in
# re-parses them as SQL. Flag concatenated/formatted queries;
# bound parameters ($1, $2) keep code and data apart.
import asyncpg


async def flag_concat(user):
    conn = await asyncpg.connect(dsn)
    # ruleid: asyncpg-sqli
    await conn.execute('SELECT * FROM users WHERE name=' + user)
    # ruleid: asyncpg-sqli
    await conn.fetch('SELECT * FROM users WHERE name=%s' % user)
    # ruleid: asyncpg-sqli
    await conn.fetchrow('SELECT * FROM users WHERE name={}'.format(user))


async def safe_bound(user):
    conn = await asyncpg.connect(dsn)
    # ok: asyncpg-sqli
    await conn.execute('SELECT * FROM users WHERE name=$1', user)
    # ok: asyncpg-sqli
    await conn.fetch('SELECT * FROM users WHERE name=$1', user)
    # ok: asyncpg-sqli
    await conn.fetch('SELECT * FROM users')
