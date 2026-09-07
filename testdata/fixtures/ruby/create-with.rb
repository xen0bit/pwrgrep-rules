def create_index
  # ruleid: create-with
  User.create_with(name: params[:name])

  # ruleid: create-with
  Post.create_with(title: params[:title])

  # ruleid: create-with
  Account.create_with(user_params)
end

def create_safe
  # ok: create-with
  User.create_with(params.permit(:name))

  # ok: create-with
  Post.create_with(params.require(:post).permit(:title))

  # ok: create-with
  User.create(name: 'fixed')
end
