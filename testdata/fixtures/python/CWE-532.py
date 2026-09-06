# CWE-532: Sensitive information is written to the log.
#
# Logging a password, secret or token exposes it in log files, which are
# often world-readable or shipped to a third party. The sink is a logging
# call where the message contains a sensitive name, and the `ok` cases use
# a constant or redacted value.
import logging
import os

logger = logging.getLogger(__name__)
password = "hunter2"
secret = os.environ.get("SECRET")


def leak():
    pwd = "s3cr3t"
    # ruleid: python-sensitive-log
    logger.info(pwd)
    # ruleid: python-sensitive-log
    logging.info(password)
    # ruleid: python-sensitive-log
    logger.debug(secret)
    # ruleid: python-sensitive-log
    logging.warning("password=" + password)


def safe():
    # ok: python-sensitive-log
    logger.info("user logged in")
    # ok: python-sensitive-log
    logging.info("request processed")
    # ok: python-sensitive-log
    logger.debug("redacted")
