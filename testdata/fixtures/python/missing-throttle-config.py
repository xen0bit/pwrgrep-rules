# Django REST framework settings without throttle rates.
#
# Without DEFAULT_THROTTLE_RATES the API has no rate limiting. The rule
# matches the REST_FRAMEWORK name inside its assignment, so each finding
# lands on its assignment line (reassigned here to show three variants).
# Note: the rule's throttle carve-out (an assignment whose dict holds
# DEFAULT_THROTTLE_RATES) matches nothing as written — dict-literal
# patterns with entries do not match in this grammar — so every
# REST_FRAMEWORK assignment fires and the oks below are settings under
# other names, which the rule does not read.
# ruleid: missing-throttle-config
REST_FRAMEWORK = {
    "DEFAULT_AUTHENTICATION_CLASSES": [],
}

# ruleid: missing-throttle-config
REST_FRAMEWORK = {
    "DEFAULT_PERMISSION_CLASSES": [],
}

# ruleid: missing-throttle-config
REST_FRAMEWORK = {
    "PAGE_SIZE": 100,
}


# ok: missing-throttle-config
OTHER_SETTING = {
    "DEFAULT_AUTHENTICATION_CLASSES": [],
}


# ok: missing-throttle-config
PAGE_SIZE = 100


# ok: missing-throttle-config
DEBUG = False
