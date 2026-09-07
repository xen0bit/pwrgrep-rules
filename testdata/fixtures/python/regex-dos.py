# Nested quantifiers like (a+)+ turn a long input into an hours-long
# backtrack (ReDoS). Flag compiled patterns the analyzer calls
# inefficient; plain patterns are fine.
import re


def flag_nested(text):
    # ruleid: regex_dos
    rx = re.compile("(a+)+$")
    rx.match(text)


def flag_star(text):
    # ruleid: regex_dos
    rx = re.compile("([a-zA-Z]+)*$")
    rx.match(text)


def flag_alt(text):
    # ruleid: regex_dos
    rx = re.compile("(a|aa)+$")
    rx.match(text)


def safe_plain(text):
    # ok: regex_dos
    rx = re.compile("[a-z]+")
    rx.match(text)


def safe_date(text):
    # ok: regex_dos
    rx = re.compile(r"\d{4}-\d{2}-\d{2}")
    rx.match(text)


def safe_word(text):
    # ok: regex_dos
    rx = re.compile("hello")
    rx.match(text)
