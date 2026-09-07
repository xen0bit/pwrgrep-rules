def create_index
  # ruleid: mass-assignment-protection-disabled
  User.new(params[:user], :without_protection => true)

  # ruleid: mass-assignment-protection-disabled
  Post.new(params[:post], :without_protection => true)

  # ruleid: mass-assignment-protection-disabled
  Account.new(params[:account], :without_protection => true)
end

def create_safe
  # ok: mass-assignment-protection-disabled
  User.new(params[:user])

  # ok: mass-assignment-protection-disabled
  Post.new(params.require(:post).permit(:title))

  # ok: mass-assignment-protection-disabled
  User.new(name: 'fixed')
end
