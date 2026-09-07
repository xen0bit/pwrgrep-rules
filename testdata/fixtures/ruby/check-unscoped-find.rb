def find_index
  # ruleid: check-unscoped-find
  User.find(params[:id])
end

def find_other
  # ruleid: check-unscoped-find
  Post.find_by_id(params[:id])
end

def find_third
  # ruleid: check-unscoped-find
  Account.find(cookies[:id])
end

def find_safe
  # ok: check-unscoped-find
  User.find(1)
end

def find_scoped
  # ok: check-unscoped-find
  current_user.posts.find(params[:id])
end

def find_plain(id)
  # ok: check-unscoped-find
  User.find(id)
end
