# Logging an error you then swallow (or re-raise without handling)
# duplicates the report and confuses triage. Flag logger.error/exception
# followed by raise inside a handler; logging at other levels (or
# handling) is fine.
import logging

logger = logging.getLogger(__name__)


def flag_reraise():
    try:
        work()
    except ValueError as exc:
        # ruleid: logging-error-without-handling
        logger.error("failed: %s", exc)
        raise


def flag_raise_from():
    try:
        work()
    except ValueError as exc:
        # ruleid: logging-error-without-handling
        logger.exception("failed")
        raise RuntimeError("wrapped") from exc


def flag_raise_value():
    try:
        work()
    except ValueError as exc:
        # ruleid: logging-error-without-handling
        logger.error("failed: %s", exc)
        raise exc


def safe_info():
    try:
        work()
    except ValueError as exc:
        # ok: logging-error-without-handling
        logger.info("failed: %s", exc)
        raise


def safe_handled():
    try:
        work()
    except ValueError as exc:
        # ok: logging-error-without-handling
        logger.error("failed: %s", exc)
        fallback()


def safe_reraise_plain():
    try:
        work()
    except ValueError:
        # ok: logging-error-without-handling
        raise
