# urllib with a computed URL fetches whatever the caller chose (SSRF).
# Flag non-literal URLs; constant URLs are fixed destinations.
import urllib.request


def flag_dynamic(url, out):
    # ruleid: dynamic-urllib-use-detected
    data = urllib.urlopen(url)
    # ruleid: dynamic-urllib-use-detected
    data = urllib.request.urlopen(url)
    # ruleid: dynamic-urllib-use-detected
    urllib.request.urlretrieve(url, out)


def safe_literal(out):
    # ok: dynamic-urllib-use-detected
    data = urllib.urlopen("https://example.com/api")
    # ok: dynamic-urllib-use-detected
    data = urllib.request.urlopen("https://example.com/api")
    # ok: dynamic-urllib-use-detected
    data = urllib.urlopen("https://example.com/other")
