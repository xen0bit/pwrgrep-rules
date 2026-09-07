# xml.etree parses external entities: a doctored file reads local
# files and phones home (XXE). Flag parse of anything but a literal;
# defusedxml (or a constant path) is the fix.
import xml.etree.ElementTree


def flag_data(path):
    # ruleid: use-defused-xml-parse
    tree = xml.etree.ElementTree.parse(path)
    # ruleid: use-defused-xml-parse
    tree = xml.etree.ElementTree.parse(uploaded_file)
    # ruleid: use-defused-xml-parse
    tree = xml.etree.ElementTree.parse(request_file)


def safe_literal():
    # ok: use-defused-xml-parse
    tree = xml.etree.ElementTree.parse("static/config.xml")
    # ok: use-defused-xml-parse
    tree = xml.etree.ElementTree.parse("static/other.xml")
    # ok: use-defused-xml-parse
    tree = xml.etree.ElementTree.parse("data.xml")
