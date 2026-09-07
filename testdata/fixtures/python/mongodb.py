# MONGODB-CR was removed in MongoDB 4.0: clients asking for it cannot
# authenticate. Flag authMechanism='MONGODB-CR'; SCRAM is the fix.
# (The rule matches the single-quoted spelling.)
import pymongo


def flag_cr(host):
    # ruleid: mongo-client-bad-auth
    client = pymongo.MongoClient(host, authMechanism='MONGODB-CR')
    # ruleid: mongo-client-bad-auth
    client = pymongo.MongoClient(host, 27017, authMechanism='MONGODB-CR')
    # ruleid: mongo-client-bad-auth
    client = pymongo.MongoClient('mongodb://localhost/', authMechanism='MONGODB-CR')


def safe_scram(host):
    # ok: mongo-client-bad-auth
    client = pymongo.MongoClient(host, authMechanism='SCRAM-SHA-256')
    # ok: mongo-client-bad-auth
    client = pymongo.MongoClient(host, authMechanism='SCRAM-SHA-1')
    # ok: mongo-client-bad-auth
    client = pymongo.MongoClient(host)
