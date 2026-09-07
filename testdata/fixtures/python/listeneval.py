# logging.config.listen runs a socket server that evals what it is
# sent. Flag the call; fileConfig/dictConfig do not open that port.
import logging.config


def flag_listen():
    # ruleid: listen-eval
    logging.config.listen(9999)
    # ruleid: listen-eval
    logging.config.listen(("localhost", 9999))
    # ruleid: listen-eval
    t = logging.config.listen(9999, verify=None)


def safe_config():
    # ok: listen-eval
    logging.config.fileConfig("logging.conf")
    # ok: listen-eval
    logging.config.dictConfig(config)
    # ok: listen-eval
    logging.info("listening on 9999")
