# .delete().where(...) without .execute() never runs: it builds a
# query and drops it. Flag the no-op; .filter(...).delete() deletes.
def remove_inactive(session):
    # ruleid: delete-where-no-execute
    session.query(User).delete().where(User.active == False)


def remove_old(session):
    # ruleid: delete-where-no-execute
    session.query(Order).delete().where(Order.total == 0)


def remove_guest(session):
    # ruleid: delete-where-no-execute
    session.query(Guest).delete().where(Guest.seen == True)


def safe_filter_delete(session):
    # ok: delete-where-no-execute
    session.query(User).filter(User.active == False).delete()
    # ok: delete-where-no-execute
    session.query(Order).filter(Order.total == 0).delete()
    # ok: delete-where-no-execute
    session.query(Guest).filter(Guest.seen == True).delete()
