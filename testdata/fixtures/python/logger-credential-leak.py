# Logging a secret sends it wherever logs go. Flag logger calls that
# interpolate a secret-named value; other values are routine.
import logging

logger = logging.getLogger(__name__)


def flag_secret(key, token):
    # ruleid: python-logger-credential-disclosure
    logger.info("api_key=%s", key)
    # ruleid: python-logger-credential-disclosure
    logger.error("password=%s", token)
    # ruleid: python-logger-credential-disclosure
    logger.debug("token=%s", token)


def safe_other(name):
    # ok: python-logger-credential-disclosure
    logger.info("hello %s", name)
    # ok: python-logger-credential-disclosure
    logger.info("done")
    # ok: python-logger-credential-disclosure
    print("key=%s" % name)
