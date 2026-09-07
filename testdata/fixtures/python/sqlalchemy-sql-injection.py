# filter/order_by with raw formatted SQL re-parses values as SQL. Flag
# formatted strings in those clauses (bindparams is the escape hatch);
# column expressions compare in SQL. Findings land on the def line.
# ruleid: sqlalchemy-sql-injection
def by_name(session, name):
    model = User
    session.query(User).filter("name = '{}'".format(name))


# ruleid: sqlalchemy-sql-injection
def ordered(session, col):
    model = User
    session.query(User).order_by("name {}".format(col))


# ruleid: sqlalchemy-sql-injection
def grouped(session, col):
    model = User
    session.query(User).group_by("dept {}".format(col))


# ok: sqlalchemy-sql-injection
def safe_columns(session, name):
    model = User
    session.query(User).filter(User.name == name)


# ok: sqlalchemy-sql-injection
def safe_order(session):
    model = User
    session.query(User).order_by(User.name)


# ok: sqlalchemy-sql-injection
def safe_bound(session, name):
    model = User
    session.query(User).filter(text("name = :n").bindparams(n=name))
