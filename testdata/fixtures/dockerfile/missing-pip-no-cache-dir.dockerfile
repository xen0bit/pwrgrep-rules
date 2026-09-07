# Cached wheels bloat the layer; disable the cache per install or globally.
# Flagged lines fetch with the cache on, fixed lines turn it off.
FROM python:3.12-slim
# ruleid: missing-pip-no-cache-dir
RUN pip install flask
# ruleid: missing-pip-no-cache-dir
RUN pip3 install requests==2.31.0
# ok: missing-pip-no-cache-dir
RUN pip install --no-cache-dir flask
# ok: missing-pip-no-cache-dir
RUN pip3 install --no-cache-dir requests==2.31.0
# ruleid: missing-pip-no-cache-dir
RUN pip install -r requirements.txt
# ok: missing-pip-no-cache-dir
RUN echo done
