"""global-autoescape-off: Django autoescape disabled globally.

Turning autoescape off in TEMPLATES OPTIONS is reported; leaving it
on, or not setting it at all, is not.
"""

TEMPLATES_OFF = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'OPTIONS': {
            # ruleid: global-autoescape-off
            'autoescape': False,
        },
    },
]

TEMPLATES_MIXED = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'OPTIONS': {
            'context_processors': [],
            # ruleid: global-autoescape-off
            'autoescape': False,
        },
    },
]

TEMPLATES_ON = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'OPTIONS': {
            # ok: global-autoescape-off
            'autoescape': True,
        },
    },
]

TEMPLATES_DEFAULT = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        # ok: global-autoescape-off
        'APP_DIRS': True,
    },
]
