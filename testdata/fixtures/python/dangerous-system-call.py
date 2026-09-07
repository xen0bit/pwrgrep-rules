# Lambda os.system/os.popen with event-tainted command.
#
# These hand the string to /bin/sh, so event input becomes shell syntax.
# Fixed code passes only literals.
import os


def handler(event, context):
    cmd = event.get("cmd")
    # ruleid: dangerous-system-call
    os.system(cmd)


def handler_direct(event, context):
    # ruleid: dangerous-system-call
    os.system(event["cmd"])


def handler_popen(event, context):
    cmd = event.get("cmd")
    # ruleid: dangerous-system-call
    os.popen(cmd)


def handler_literal(event, context):
    # ok: dangerous-system-call
    os.system("uptime")


def handler_popen_literal(event, context):
    # ok: dangerous-system-call
    os.popen("uptime")


def unrelated():
    # ok: dangerous-system-call
    os.system("uptime")
