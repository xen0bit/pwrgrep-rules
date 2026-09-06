# CWE-434: Unrestricted upload — filename from request.files reaches file write without whitelist.
from flask import request
import os

def upload_vuln():
    f = request.files.get('file')
    name = f.filename
    # ruleid: python-unrestricted-upload
    open(os.path.join('/uploads', name), 'wb').write(f.read())
    # ruleid: python-unrestricted-upload
    f.save(os.path.join('/tmp', name))

def upload_vuln_s3():
    uploaded = request.files['file']
    fname = uploaded.filename
    # ruleid: python-unrestricted-upload
    s3.upload_file(os.path.join('/tmp', fname), 'mybucket', fname)

def safe_fixed():
    # ok: python-unrestricted-upload
    open('/tmp/fixed.txt', 'wb').write(b'fixed')
    # ok: python-unrestricted-upload
    s3.upload_file('/tmp/fixed.txt', 'mybucket', 'fixed.txt')

def safe_whitelist():
    f = request.files.get('file')
    name = f.filename
    if not name.endswith('.png'):
        raise ValueError('bad extension')
    # ok: python-unrestricted-upload
    open(os.path.join('/uploads', 'safe.png'), 'wb').write(f.read())
