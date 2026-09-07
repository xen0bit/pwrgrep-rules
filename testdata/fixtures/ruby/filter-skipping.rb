# filter-skipping: routes rendering arbitrary actions.
# ruleid: filter-skipping
render "/show/:action/details"
# ruleid: filter-skipping
redirect_to "/user/:action/profile"
# ok: filter-skipping
render "/show/:action/details", layout: "app"
# ok: filter-skipping
render "static/page"
