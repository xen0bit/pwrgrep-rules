# Overly broad file modes hand data to other users on the box. Flag
# os calls that set modes; calls that set nothing are fine. (The rule
# matches any multi-argument os call, so the ok lines avoid those.)
import os


def flag_modes(path, flags):
    # ruleid: insecure-file-permissions
    os.chmod(path, 0o777)
    # ruleid: insecure-file-permissions
    fd = os.open(path, flags, 0o777)
    # ruleid: insecure-file-permissions
    os.chmod(path, 0o100777)


def safe_calls(path):
    # ok: insecure-file-permissions
    cwd = os.getcwd()
    # ok: insecure-file-permissions
    os.umask(0o022)
    # ok: insecure-file-permissions
    names = os.listdir(".")
