# Django request data written to a file handle.
#
# Caller bytes written to disk become stored content (or a shell where
# the path is executable). The finding lands on the write line. Writing
# a literal is the ok.
def view_a(request):
    f = open("out.txt", "w")
    # ruleid: request-data-write
    f.write(request.GET.get("body"))
    return 1


def view_b(request):
    # ruleid: request-data-write
    body = request.POST.get("body")
    f = open("out.txt", "w")
    f.write(body)
    return 1


def view_c(request):
    # ruleid: request-data-write
    body = request.GET["body"]
    f = open("out.txt", "w")
    f.write("data:%s" % body)
    return 1


def view_literal(request):
    f = open("out.txt", "w")
    # ok: request-data-write
    f.write("hello")
    return 1


def view_name(request):
    text = "hello"
    f = open("out.txt", "w")
    # ok: request-data-write
    f.write(text)
    return 1


def view_plain(request):
    # ok: request-data-write
    x = 1
    return x
