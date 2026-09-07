# psycopg2 executes whatever string it is handed: formatting values in
# re-parses them as SQL. Flag concatenated/formatted queries;
# bound parameters keep code and data apart.
import psycopg2


def flag_concat(user):
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()
    # ruleid: psycopg-sqli
    cur.execute('SELECT * FROM users WHERE name=' + user)
    # ruleid: psycopg-sqli
    cur.execute('SELECT * FROM users WHERE name=%s' % user)
    # ruleid: psycopg-sqli
    cur.execute('SELECT * FROM users WHERE name={}'.format(user))


def safe_bound(user):
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()
    # ok: psycopg-sqli
    cur.execute('SELECT * FROM users WHERE name=%s', (user,))
    # ok: psycopg-sqli
    cur.executemany('INSERT INTO t VALUES (%s)', [(user,)])
    # ok: psycopg-sqli
    cur.execute('SELECT * FROM users')
