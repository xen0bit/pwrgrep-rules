# Flask hardcoded TESTING config (first id only).
#
# This rule reports four ids (TESTING, SECRET_KEY, ENV, DEBUG); the
# fixture covers the first, avoid_hardcoded_config_TESTING, since a
# fixture may only carry its rule's first id. Reading the flag from the
# environment is the fix.
import os

# ruleid: avoid_hardcoded_config_TESTING
app.config['TESTING'] = True

# ruleid: avoid_hardcoded_config_TESTING
app.config['TESTING'] = False

# ruleid: avoid_hardcoded_config_TESTING
app.config.update(TESTING=True)

# ok: avoid_hardcoded_config_TESTING
app.config['TESTING'] = os.environ.get("TESTING") == "1"

# ok: avoid_hardcoded_config_TESTING
TESTING = os.environ.get("TESTING") == "1"

# ok: avoid_hardcoded_config_TESTING
DEBUG = False
