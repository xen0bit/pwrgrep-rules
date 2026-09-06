# CWE-89 SQL Injection in Ruby / ActiveRecord
# Building SQL via string interpolation with user input bypasses parameterisation
# and lets an attacker inject arbitrary SQL.

def search
  user = params[:user]
  name = params["name"]
  qs = request.query_string
  ck = cookies[:id]

  # ruleid: ruby-sql-injection
  ActiveRecord::Base.connection.execute("SELECT * FROM users WHERE name = '#{user}'")

  # ruleid: ruby-sql-injection
  User.where("name = '#{name}'")

  # ruleid: ruby-sql-injection
  User.find_by_sql("SELECT * FROM users WHERE id = #{qs}")

  # ruleid: ruby-sql-injection
  ActiveRecord::Base.connection.exec_query("SELECT * FROM users WHERE id = " + ck)

  # ok: ruby-sql-injection
  User.where("name = ?", "fixed")

  # ok: ruby-sql-injection
  ActiveRecord::Base.connection.execute("SELECT * FROM users WHERE name = 'fixed'")

  # ok: ruby-sql-injection
  User.find(1)
end
