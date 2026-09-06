class UsersController < ApplicationController
  def vuln1
    user = params[:user]
    # ruleid: ruby-sqli
    User.where("name = '" + user + "'")
  end

  def vuln2
    id = params[:id]
    # ruleid: ruby-sqli
    User.find_by_sql("SELECT * FROM users WHERE id = " + id)
  end

  def safe1
    # ok: ruby-sqli
    User.where(name: "fixed")
  end

  def safe2
    user = "fixed"
    # ok: ruby-sqli
    User.where("name = '" + user + "'")
  end

  def vuln3
    q = params[:q]
    # ruleid: ruby-sqli
    ActiveRecord::Base.connection.execute("SELECT * FROM data WHERE q = '" + q + "'")
  end

  def vuln4
    name = params[:name]
    # ruleid: ruby-sqli
    User.where("email = '" + name + "'")
  end

  def safe3
    # ok: ruby-sqli
    User.where("name = ?", params[:user])
  end
end
