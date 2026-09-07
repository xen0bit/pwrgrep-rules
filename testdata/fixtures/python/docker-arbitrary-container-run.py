# A container image name from data runs attacker-chosen code as root
# on the host. Flag run/create with a variable image; a pinned literal
# image is the fix.
import docker

client = docker.from_env()


def flag_variable(image, cmd):
    # ruleid: docker-arbitrary-container-run
    client.containers.run(image)
    # ruleid: docker-arbitrary-container-run
    client.containers.run(image, detach=True)
    # ruleid: docker-arbitrary-container-run
    client.containers.create(cmd)


def safe_pinned():
    # ok: docker-arbitrary-container-run
    client.containers.run("nginx", detach=True)
    # ok: docker-arbitrary-container-run
    client.containers.run("redis", "redis-server --appendonly yes")
    # ok: docker-arbitrary-container-run
    client.containers.create("postgres", environment=["PGDATA=/data"])
