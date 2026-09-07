# len(query.all()) fetches every row to count them; COUNT(*) counts
# server-side. Flag len(.all()); .count() is the fix. (Only the first
# id, len-all-count, is annotated.)
def count_users(session):
    # ruleid: len-all-count
    return len(session.query(User).all())
    # ruleid: len-all-count
    return len(session.query(Order).all())
    # ruleid: len-all-count
    return len(session.query(Guest).all())


def safe_count(session):
    # ok: len-all-count
    return session.query(User).count()
    # ok: len-all-count
    return session.query(Order).count()
    # ok: len-all-count
    return session.query(Guest).count()
