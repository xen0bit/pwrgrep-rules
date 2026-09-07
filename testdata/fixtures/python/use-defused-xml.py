# The stdlib xml package parses external entities (XXE); the docs
# point at defusedxml instead. Flag `import xml`; defusedxml (or an
# unrelated import) is the fix.
# ok: use-defused-xml
import json


def flag_import():
    # ruleid: use-defused-xml
    import xml
    # ruleid: use-defused-xml
    import xml
    # ruleid: use-defused-xml
    import xml


def safe_imports():
    # ok: use-defused-xml
    import defusedxml.ElementTree
    # ok: use-defused-xml
    from defusedxml import ElementTree
