# CWE-117: Log injection — untrusted data is written to the log.
#
# A value the caller chose that reaches a logging sink can contain `\n` or
# other control characters. A newline in the log forges a new entry, hiding
# or inventing events.
import logging
from flask import request

logger = logging.getLogger(__name__)


@app.route("/log/<msg>")
def from_route(msg):
    # ruleid: python-log-injection
    logging.info(msg)
    # ruleid: python-log-injection
    logger.info(msg)


def from_query():
    user = request.args.get("user")
    # ruleid: python-log-injection
    logging.info(user)
    # ruleid: python-log-injection
    logger.warning(user)
    # Propagation through a variable — reaching must follow it.
    m = user
    # ruleid: python-log-injection
    logger.error(m)
    # ruleid: python-log-injection
    logging.debug(m)


def safe_literal():
    # ok: python-log-injection
    logging.info("user logged in")
    # ok: python-log-injection
    logger.info("request processed")
    # ok: python-log-injection
    logging.warning("static message")


def safe_constant():
    msg = "hello"
    # ok: python-log-injection
    logger.info(msg)
