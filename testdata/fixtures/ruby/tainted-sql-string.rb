def sql_index
  # ruleid: tainted-sql-string
  User.where("name = #{params[:name]}")

  # ruleid: tainted-sql-string
  Post.where("title = #{params[:title]}")

  # ruleid: tainted-sql-string
  Comment.where("body = %s" % params[:body])
end

def sql_safe
  # ok: tainted-sql-string
  User.where("name = ?", params[:name])

  # ok: tainted-sql-string
  Post.where(title: 'fixed')

  # ok: tainted-sql-string
  Comment.where("body = 'static'")
end
