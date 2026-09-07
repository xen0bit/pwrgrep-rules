# Django views exempted from CSRF protection.
#
# csrf_exempt removes the token check, so the route accepts forged
# cross-site posts. Per GUIDE, CSRF is not taint: the rule is one AST
# pattern for the decorator, and the finding lands on its line.
import django.views.decorators.csrf


# ruleid: no-csrf-exempt
@django.views.decorators.csrf.csrf_exempt
def transfer(request):
    return "transferred"


# ruleid: no-csrf-exempt
@django.views.decorators.csrf.csrf_exempt
def update(request):
    return "updated"


# ruleid: no-csrf-exempt
@django.views.decorators.csrf.csrf_exempt
def delete(request):
    return "deleted"


# ok: no-csrf-exempt
def safe_view(request):
    return "safe"


# ok: no-csrf-exempt
def login_protected(request):
    return "also safe"


# ok: no-csrf-exempt
def plain(request):
    x = 1
    return x
