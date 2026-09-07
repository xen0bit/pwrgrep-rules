# psycopg2 executes whatever string it is handed: formatting the Lambda
# event into the query re-parses attacker input as SQL. Flag
# concatenated/formatted queries built from `event`; bound parameters
# keep code and data apart.
import psycopg2


def flag_concat(event, context):
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()
    name = event['name']
    # ruleid: psycopg-sqli
    cur.execute('SELECT * FROM users WHERE name=' + name)


def flag_percent(event, context):
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()
    # ruleid: psycopg-sqli
    cur.execute('SELECT * FROM users WHERE name=%s' % event['name'])


def flag_format(event, context):
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()
    # ruleid: psycopg-sqli
    cur.execute('SELECT * FROM users WHERE name={}'.format(event['name']))


def safe_bound(event, context):
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()
    # ok: psycopg-sqli
    cur.execute('SELECT * FROM users WHERE name=%s', (event['name'],))
    # ok: psycopg-sqli
    cur.executemany('INSERT INTO t VALUES (%s)', [(event['name'],)])


def safe_const(event, context):
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()
    # ok: psycopg-sqli
    cur.execute('SELECT * FROM users')
