# The stdlib xmlrpc client parses external entities (XXE); the docs
# point at defusedxml instead. Flag the stdlib imports; defusedxml
# (or an unrelated import) is the fix.
# ok: use-defused-xmlrpc
import json


def flag_import():
    # ruleid: use-defused-xmlrpc
    import xmlrpc
    # ruleid: use-defused-xmlrpc
    import xmlrpclib
    # ruleid: use-defused-xmlrpc
    import SimpleXMLRPCServer


def safe_imports():
    # ok: use-defused-xmlrpc
    import defusedxml.xmlrpc
    # ok: use-defused-xmlrpc
    from defusedxml.xmlrpc import monkey_patch
