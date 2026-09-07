# pg8000 executes whatever string it is handed: formatting values in
# re-parses them as SQL. Flag concatenated/formatted queries;
# bound parameters keep code and data apart.
import pg8000


def flag_concat(user):
    conn = pg8000.connect(user="app")
    cur = conn.cursor()
    # ruleid: pg8000-sqli
    cur.execute('SELECT * FROM users WHERE name=' + user)
    # ruleid: pg8000-sqli
    cur.execute('SELECT * FROM users WHERE name=%s' % user)
    # ruleid: pg8000-sqli
    cur.execute('SELECT * FROM users WHERE name={}'.format(user))


def safe_bound(user):
    conn = pg8000.connect(user="app")
    cur = conn.cursor()
    # ok: pg8000-sqli
    cur.execute('SELECT * FROM users WHERE name=%s', (user,))
    # ok: pg8000-sqli
    cur.execute('SELECT * FROM users WHERE name=%(name)s', {"name": user})
    # ok: pg8000-sqli
    cur.execute('SELECT * FROM users')
