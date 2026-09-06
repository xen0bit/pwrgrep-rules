# CWE-710: Deprecated instruction — use label instead.
# That maintainer instruction has been replaced by a label. The rule
# flags any occurrence; fix with a label instruction.
FROM alpine
# ruleid: maintainer-is-deprecated
MAINTAINER John Doe <john@example.com>
# ruleid: maintainer-is-deprecated
MAINTAINER Jane
# ok: maintainer-is-deprecated
LABEL maintainer="John Doe"
# ok: maintainer-is-deprecated
LABEL version="1.0"
# ruleid: maintainer-is-deprecated
MAINTAINER Bob Smith <bob@example.com>
# ruleid: maintainer-is-deprecated
MAINTAINER Alice <alice@example.org>
# ok: maintainer-is-deprecated
LABEL maintainer="Bob"
