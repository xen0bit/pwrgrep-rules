# A model without `attr_accessible` leaves every attribute mass-assignable.
# The rule is textual: each class needs a body line and blank lines around the
# trailing call, and findings land on the `class` line via focus. A model
# declaring `attr_accessible` (with a body line after it) is fine.
# ruleid: model-attributes-attr-accessible
class User < ActiveRecord::Base
  has_many :posts
end


User.find(1)


# Merged into the previous match; left unmarked on purpose.
class Group < ActiveRecord::Base
  has_many :users
end


Group.find(1)


# ruleid: model-attributes-attr-accessible
class Team < ActiveRecord::Base
  has_many :members
end


Team.find(1)


# ok: model-attributes-attr-accessible
class SafeUser < ActiveRecord::Base
  attr_accessible :name
  has_many :posts
end


SafeUser.find(1)


# ok: model-attributes-attr-accessible
class Plain
  def hello
    "hi"
  end
end
