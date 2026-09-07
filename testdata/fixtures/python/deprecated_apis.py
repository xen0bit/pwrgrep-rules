# Bokeh deprecated two import locations; the old paths still import but
# will stop working. Flag the deprecated locations; the replacements
# live directly under bokeh.layouts and bokeh.models.graphs.
# ok lines import the supported locations instead.

# ruleid: bokeh-deprecated-apis
import bokeh.layouts.widgetbox
# ruleid: bokeh-deprecated-apis
import bokeh.models.graphs.from_networkx


def safe_supported():
    # ok: bokeh-deprecated-apis
    import bokeh.layouts
    # ok: bokeh-deprecated-apis
    import bokeh.models.graphs
    # ok: bokeh-deprecated-apis
    from bokeh.plotting import figure
