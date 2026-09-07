# Lambda DynamoDB scan/query filter built from event input.
#
# A ScanFilter/QueryFilter holding caller input changes which rows come
# back. Fixed code passes only literals.
import boto3

db = boto3.resource('dynamodb')
table = db.Table('users')


def handler(event, context):
    name = event.get("name")
    # ruleid: dynamodb-filter-injection
    table.scan(ScanFilter=name)


def handler_direct(event, context):
    # ruleid: dynamodb-filter-injection
    table.scan(ScanFilter=event["name"])


def handler_query(event, context):
    name = event.get("name")
    # ruleid: dynamodb-filter-injection
    table.query(QueryFilter=name)


def handler_literal(event, context):
    # ok: dynamodb-filter-injection
    table.scan(ScanFilter="alice")


def handler_query_literal(event, context):
    # ok: dynamodb-filter-injection
    table.query(QueryFilter="alice")


def unrelated():
    # ok: dynamodb-filter-injection
    table.scan(ScanFilter="alice")
