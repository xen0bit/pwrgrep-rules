# SSH exec runs the string on the remote host: formatting data into
# it is remote shell injection. Flag non-literal commands; a fixed
# command string is fine.
import paramiko.client


def flag_dynamic(client, target):
    # ruleid: paramiko-exec-command
    stdin, stdout, stderr = client.exec_command("ls " + target)
    # ruleid: paramiko-exec-command
    stdin, stdout, stderr = client.exec_command(f"cat {target}")
    # ruleid: paramiko-exec-command
    stdin, stdout, stderr = client.exec_command(target)


def safe_literal():
    client = paramiko.client.SSHClient()
    # ok: paramiko-exec-command
    stdin, stdout, stderr = client.exec_command("uptime")
    # ok: paramiko-exec-command
    stdin, stdout, stderr = client.exec_command("ls -l /data")
    # ok: paramiko-exec-command
    stdin, stdout, stderr = client.exec_command("whoami")
