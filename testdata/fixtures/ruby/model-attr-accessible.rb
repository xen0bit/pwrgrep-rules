class User < ActiveRecord::Base
  # ruleid: model-attr-accessible
  attr_accessible :name, :admin
end

class Post < ActiveRecord::Base
  # ruleid: model-attr-accessible
  attr_accessible :title, :role
end

def update_index
  # ruleid: model-attr-accessible
  params.permit(:name, :admin)
end

class SafeUser < ActiveRecord::Base
  # ok: model-attr-accessible
  attr_accessible :name, :email
end

def update_safe
  # ok: model-attr-accessible
  params.permit(:name, :email)
end

def update_plain
  # ok: model-attr-accessible
  params.require(:user)
end
