# TwiML is XML: interpolating values into it injects extra verbs the
# caller did not intend. Flag formatted twiml=; a constant, or escaping
# the value with html.escape, is the fix.
import html

from twilio.rest import Client


def make_call(client, to, frm, name):
    message = f"<Response><Say>Hello {name}</Say></Response>"
    # ruleid: twiml-injection
    call = client.calls.create(to=to, from_=frm, twiml=message)
    return call


def make_percent(client, to, frm, name):
    message = "<Response><Say>Hello %s</Say></Response>" % name
    # ruleid: twiml-injection
    call = client.calls.create(to=to, from_=frm, twiml=message)
    return call


def make_format(client, to, frm, name):
    message = "<Response><Say>Hello {}</Say></Response>".format(name)
    # ruleid: twiml-injection
    call = client.calls.create(to=to, from_=frm, twiml=message)
    return call


def safe_constant():
    # ok: twiml-injection
    call = outbound.calls.create(to="+15551234567", from_="+15557654321", twiml="<Response><Say>Hello</Say></Response>")
    return call


def safe_escaped(client, to, frm, name):
    # ok: twiml-injection
    call = client.calls.create(to=to, from_=frm, twiml=html.escape(name))
    return call


def safe_sax(client, to, frm, name):
    import xml.sax.saxutils
    # ok: twiml-injection
    call = client.calls.create(to=to, from_=frm, twiml=xml.sax.saxutils.escape(name))
    return call
