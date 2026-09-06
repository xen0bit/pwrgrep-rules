# CWE-863b: IDOR via Model.query.get(request args id) outside has_role
# Direct object reference via request.args id flowing into Model.query.get without role check.
from flask import Flask, request

app = Flask(__name__)

class UserModel:
    query = None

class AccountModel:
    query = None

class DataModel:
    query = None

def vuln_idor1():
    uid = request.args.get("id")
    # ruleid: python-863-idor
    user = UserModel.query.get(uid)
    return user

def vuln_idor2():
    data_id = request.args.get("id")
    # ruleid: python-863-idor
    data = DataModel.query.get(data_id)
    return data

def vuln_idor3():
    aid = request.values.get("id")
    # ruleid: python-863-idor
    acc = AccountModel.query.get(aid)
    return acc

# has_role decorator protects access
@has_role('admin')
def safe_idor1():
    uid = request.args.get("id")
    # ok: python-863-idor
    user = UserModel.query.get(uid)
    return user

# requires_roles protects and hardcoded id
@requires_roles('admin')
def safe_idor2():
    # ok: python-863-idor
    user = UserModel.query.get(123)
    return user
