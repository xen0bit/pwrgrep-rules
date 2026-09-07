# Django requests call with request data as the URL (SSRF).
#
# The server fetches a caller-chosen URL, reaching the cloud metadata
# address and the intranet. The readings need bare-statement tails
# (assigned forms match two readings at once), so each case fetches bare
# and the finding lands on the request line that starts the match. A
# literal URL is the ok.
import requests


def view_a(request):
    # ruleid: ssrf-injection-requests
    requests.get(request.GET.get("url"))
    return 1


def view_b(request):
    # ruleid: ssrf-injection-requests
    url = request.GET["url"]
    requests.get(url)
    return 1


def view_c(request):
    # ruleid: ssrf-injection-requests
    url = request.POST.get("url")
    full = "https://api.x.com/" + url
    requests.post(full)
    return 1


def view_literal(request):
    # ok: ssrf-injection-requests
    requests.get("https://api.x.com/health")
    return 1


def view_const(request):
    url = "https://api.x.com/health"
    # ok: ssrf-injection-requests
    requests.get(url)
    return 1


def view_plain(request):
    # ok: ssrf-injection-requests
    x = 1
    return x
