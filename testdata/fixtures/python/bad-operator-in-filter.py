# Only real comparisons belong in a filter: `and`/`or`/`is` evaluate
# in Python, not in SQL, silently changing the query. Flag those
# operators inside filter(); ==/!= compare in SQL.
def find_active(session, flag):
    # ruleid: bad-operator-in-filter
    result = session.query(User).filter(User.active and flag)
    session.query


def find_either(session, flag, name):
    # ruleid: bad-operator-in-filter
    result = session.query(User).filter(User.name == name or flag)
    session.query


def find_role(session, flag):
    # ruleid: bad-operator-in-filter
    result = session.query(User).filter(User.role is flag)
    session.query


def safe_eq(session, name):
    # ok: bad-operator-in-filter
    result = session.query(User).filter(User.name == name)
    session.query


def safe_ne(session):
    # ok: bad-operator-in-filter
    result = session.query(User).filter(User.age != 0)
    session.query


def safe_gt(session):
    # ok: bad-operator-in-filter
    result = session.query(User).filter(User.id > 10)
    session.query
