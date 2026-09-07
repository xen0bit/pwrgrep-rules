def show_elsif
  # ok: check-http-verb-confusion
  if request.get?
    render :show
  elsif request.post?
    render :create
  else
    render :index
  end
end

def show_index
  # ruleid: check-http-verb-confusion
  if request.get?
    render :show
  else
    render :index
  end
end

def show_other
  # ruleid: check-http-verb-confusion
  if request.get?
    head :ok
  else
    head :not_found
  end
end

def show_third
  # ruleid: check-http-verb-confusion
  if request.get?
    redirect_to '/a'
  else
    redirect_to '/b'
  end
end

def show_safe
  # ok: check-http-verb-confusion
  if request.post?
    render :show
  else
    render :index
  end
end

def show_plain
  # ok: check-http-verb-confusion
  render :show
end
