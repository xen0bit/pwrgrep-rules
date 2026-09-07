def create_index
  # ruleid: mass-assignment-vuln
  User.new(params[:user])

  # ruleid: mass-assignment-vuln
  Post.new(params[:post])

  # ruleid: mass-assignment-vuln
  Account.new(params[:account])
end

class GuardedUser < ActiveRecord::Base
  attr_accessible :name
  def self.build(p)
    # ok: mass-assignment-vuln
    GuardedUser.new(p[:user])
  end
end

def create_safe
  # ok: mass-assignment-vuln
  User.new(params.require(:user).permit(:name))
end

def create_plain
  # ok: mass-assignment-vuln
  User.new(name: 'fixed')
end
