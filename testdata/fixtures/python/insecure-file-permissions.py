# Overly broad file modes hand data to other users on the box. Flag
# os calls that set modes; calls that set something else, or a mode
# no wider than 0o022, are fine.
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
    # ok: insecure-file-permissions
    version = os.getenv("OPENAI_API_VERSION", "2024-05-01")
