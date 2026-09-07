def render_index
  # ruleid: check-render-local-file-include
  render file: params[:f]
end

def render_other
  # ruleid: check-render-local-file-include
  render inline: params[:t]
end

def render_third
  # ruleid: check-render-local-file-include
  render template: params[:tpl]
end

def render_safe
  # ok: check-render-local-file-include
  render file: 'static.html'
end

def render_action
  # ok: check-render-local-file-include
  render :show
end

def render_plain(name)
  # ok: check-render-local-file-include
  render plain: name
end
