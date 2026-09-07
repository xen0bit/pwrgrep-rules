# filter/order_by/group_by with raw formatted SQL built from the request
# re-parses values as SQL. Flag formatted strings in those clauses
# (bindparams is the escape hatch); column expressions compare in SQL.
from pyramid.view import view_config


@view_config(route_name='users', renderer='json')
def by_name(request):
    q = request.dbsession.query(User)
    # ruleid: pyramid-sqlalchemy-sql-injection
    return q.filter("name = '{}'".format(request.params['name'])).all()


@view_config(route_name='ordered', renderer='json')
def ordered(request):
    q = request.dbsession.query(User)
    # ruleid: pyramid-sqlalchemy-sql-injection
    return q.order_by("name {}".format(request.params['col'])).all()


@view_config(route_name='grouped', renderer='json')
def grouped(request):
    q = request.dbsession.query(User)
    # ruleid: pyramid-sqlalchemy-sql-injection
    return q.group_by("dept {}".format(request.GET['col'])).all()


@view_config(route_name='safe', renderer='json')
def safe_columns(request):
    q = request.dbsession.query(User)
    # ok: pyramid-sqlalchemy-sql-injection
    return q.filter(User.name == request.params['name']).all()


@view_config(route_name='bound', renderer='json')
def safe_bound(request):
    q = request.dbsession.query(User)
    # ok: pyramid-sqlalchemy-sql-injection
    return q.filter(text("name = :n").bindparams(n=request.params['name'])).all()
