# The rule reports each fetch line that starts a mixed pair.
FROM ubuntu:20.04
# ruleid: use-either-wget-or-curl
RUN curl -O http://example.com/a.tar.gz
# ruleid: use-either-wget-or-curl
RUN wget http://example.com/b.tar.gz
# ruleid: use-either-wget-or-curl
RUN curl -O http://example.com/c.tar.gz
RUN wget http://example.com/d.tar.gz
# ok: use-either-wget-or-curl
RUN echo neutral-one
# ok: use-either-wget-or-curl
RUN echo neutral-two
