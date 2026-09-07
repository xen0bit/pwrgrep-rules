# A `get` handler should be free of side effects: caches and prefetching may
# call it without the user meaning to act. Flag `get(self, ...)` methods that
# end in a create/update/delete call; pure reads (and other methods) are fine.
class UserView:
    # ruleid: flask-class-method-get-side-effects
    def get(self, user_id):
        create_user(user_id)


class OrderView:
    # ruleid: flask-class-method-get-side-effects
    def get(self, order_id):
        update_order(order_id)


class SessionView:
    # ruleid: flask-class-method-get-side-effects
    def get(self, session_id):
        delete_session(session_id)


class ReadView:
    # ok: flask-class-method-get-side-effects
    def get(self, user_id):
        return fetch_user(user_id)


class WriteView:
    # ok: flask-class-method-get-side-effects
    def post(self, user_id):
        create_user(user_id)


class LookupView:
    # ok: flask-class-method-get-side-effects
    def get(self, name):
        return find_user(name)
