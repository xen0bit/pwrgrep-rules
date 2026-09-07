# A real AWS secret in code ships to everyone with repo access. Flag
# aws_*= with a high-entropy literal; EXAMPLE/placeholder values and
# variables from the environment are fine.
import os

import boto3


def flag_hardcoded():
    # ruleid: hardcoded-token
    client = boto3.client("s3", aws_secret_access_key="wJalrXUtnFEMI/K7MDENG/bPxRfiCY1234567890")
    # ruleid: hardcoded-token
    session = boto3.Session(aws_access_key_id="AKIAIOSFODNN7A1B2C3D4")
    # ruleid: hardcoded-token
    client = boto3.client("ec2", aws_session_token="FQoGZXIvYXdzEN3/8PxRfiCY7MDENGbPxRfiCY1")


def safe_reference():
    # ok: hardcoded-token
    client = boto3.client("s3", aws_secret_access_key=os.environ["AWS_SECRET"])
    # ok: hardcoded-token
    client = boto3.client("s3", aws_secret_access_key="AKIAIOSFODNN7EXAMPLE")
    # ok: hardcoded-token
    client = boto3.client("s3", aws_secret_access_key="your-secret-key-here")
