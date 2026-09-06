# CWE-611: XML external entity (XXE) — untrusted XML is parsed with entities.
#
# `lxml.etree.fromstring`, `xml.etree.ElementTree.parse` and
# `xml.dom.minidom.parseString` with default settings resolve external
# entities. An `<!ENTITY>` in the document the caller chose becomes a file
# read or an SSRF.
import lxml.etree
import xml.etree.ElementTree
import xml.dom.minidom
from flask import request


@app.route("/xml/<doc>")
def from_route(doc):
    # ruleid: python-xxe
    lxml.etree.fromstring(doc)
    # ruleid: python-xxe
    xml.etree.ElementTree.fromstring(doc)


def from_query():
    xml_data = request.args.get("xml")
    # ruleid: python-xxe
    lxml.etree.fromstring(xml_data)
    # ruleid: python-xxe
    xml.etree.ElementTree.parse(xml_data)
    # ruleid: python-xxe
    xml.dom.minidom.parseString(xml_data)
    # Propagation through a variable — reaching must follow it.
    payload = xml_data
    # ruleid: python-xxe
    xml.etree.ElementTree.fromstring(payload)


def safe_literal():
    # ok: python-xxe
    lxml.etree.fromstring("<root><a>1</a></root>")
    # ok: python-xxe
    xml.etree.ElementTree.fromstring("<root/>")
    # ok: python-xxe
    xml.dom.minidom.parseString("<root></root>")


def safe_with_defused():
    # Using defusedxml is the recommended mitigation; the fixture marks it
    # as ok because the sink is the stdlib one.
    xml_data = request.args.get("xml")
    # ok: python-xxe
    xml.etree.ElementTree.fromstring("<safe/>")
