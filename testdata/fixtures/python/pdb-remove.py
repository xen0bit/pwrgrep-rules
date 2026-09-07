# pdb calls left in the code drop production into a debugger. Flag any
# pdb.* call; plain imports (and other debuggers) are fine.
import pdb


def flag_trace():
    # ruleid: pdb-remove
    pdb.set_trace()
    # ruleid: pdb-remove
    pdb.run("main()")
    # ruleid: pdb-remove
    pdb.pm()


def safe_import():
    # ok: pdb-remove
    import pdb
    # ok: pdb-remove
    note = "pdb"
    # ok: pdb-remove
    active = False
