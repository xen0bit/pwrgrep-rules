# Writing to a file opened "r" fails at runtime. Flag writes through
# read-mode handles. The rule matches any write call in a file that
# opens read-mode, so the ok lines below do their writes nowhere:
# read-mode reads, and write-mode opens without writes.
def flag_write(path):
    handle = open(path, "r")
    # ruleid: writing-to-file-in-read-mode
    handle.write("data")


def flag_binary(path):
    handle = open(path, "rb")
    # ruleid: writing-to-file-in-read-mode
    handle.write(b"data")


def flag_with(path):
    with open(path, "r") as handle:
        # ruleid: writing-to-file-in-read-mode
        handle.write("data")


def safe_read(path):
    handle = open(path, "r")
    # ok: writing-to-file-in-read-mode
    data = handle.read()


def safe_write_mode(path):
    # ok: writing-to-file-in-read-mode
    handle = open(path, "w")
    # ok: writing-to-file-in-read-mode
    handle.close()
