# Django urlpatterns assigning the same path twice (first id only).
#
# Two entries for one URL mean the second silently wins. This fixture
# covers the first id (same URL to the same view twice); the sibling ids
# (conflicting view, different names, duplicate names) are separate
# spellings of the same cleanup and share this rule. Each finding lands
# on the line where the duplicated list starts.
import django.urls

from . import views

# ruleid: duplicate-path-assignment
urlpatterns_a = [
    django.urls.path('a/', views.a),
    django.urls.path('a/', views.a),
]

# ruleid: duplicate-path-assignment
urlpatterns_b = [
    django.urls.path('b/', views.b),
    django.urls.path('b/', views.b),
]

# ruleid: duplicate-path-assignment
urlpatterns_c = [
    django.urls.path('c/', views.c),
    django.urls.path('c/', views.c),
]

# ok: duplicate-path-assignment
urlpatterns_ok = [
    django.urls.path('d/', views.d),
    django.urls.path('e/', views.e),
]

# ok: duplicate-path-assignment
urlpatterns_single = [
    django.urls.path('f/', views.f),
]

# ok: duplicate-path-assignment
urlpatterns_empty = []
