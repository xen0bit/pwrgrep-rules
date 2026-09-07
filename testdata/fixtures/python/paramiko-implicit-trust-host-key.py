# AutoAddPolicy (and WarningPolicy) trust the server's key on sight:
# the first connection can already be a hijack. Flag those policies
# inside an SSHClient setup; RejectPolicy is the fix.
import paramiko.client


def flag_autoadd():
    client = paramiko.client.SSHClient()
    # ruleid: paramiko-implicit-trust-host-key
    client.set_missing_host_key_policy(paramiko.client.AutoAddPolicy)


def flag_autoadd_call():
    client = paramiko.client.SSHClient()
    # ruleid: paramiko-implicit-trust-host-key
    client.set_missing_host_key_policy(paramiko.client.AutoAddPolicy())


def flag_warning():
    client = paramiko.client.SSHClient()
    # ruleid: paramiko-implicit-trust-host-key
    client.set_missing_host_key_policy(paramiko.client.WarningPolicy)


def safe_reject():
    client = paramiko.client.SSHClient()
    # ok: paramiko-implicit-trust-host-key
    client.set_missing_host_key_policy(paramiko.client.RejectPolicy)


def safe_reject_call():
    client = paramiko.client.SSHClient()
    # ok: paramiko-implicit-trust-host-key
    client.set_missing_host_key_policy(paramiko.client.RejectPolicy())


def safe_keys():
    client = paramiko.client.SSHClient()
    # ok: paramiko-implicit-trust-host-key
    client.load_system_host_keys()
