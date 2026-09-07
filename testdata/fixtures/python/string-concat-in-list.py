# Adjacent string literals concatenate: ["a" "b"] is one element, not
# two, and the missing comma is easy to miss. Flag implicit concat in
# lists and sets; explicit commas (and dicts) are fine.
def flag_concat():
    # ruleid: string-concat-in-list
    items = ["alpha" "beta"]
    # ruleid: string-concat-in-list
    pair = {"alpha" "beta"}
    # ruleid: string-concat-in-list
    mixed = ["alpha" "beta", "gamma"]


def safe_explicit():
    # ok: string-concat-in-list
    items = ["alpha", "beta"]
    # ok: string-concat-in-list
    mapping = {"alpha": 1}
    # ok: string-concat-in-list
    pair = ("alpha", "beta")
