# CWE-89: SQL Injection – user input concatenated into SQL query.
# Ecto query with variable is vulnerable; literals are safe.

defmodule Fixture.CWE89 do
  def vuln(user_input) do
    # ruleid: elixir-sql-injection
    Ecto.Adapters.SQL.query(Repo, "select * from users where id = " <> user_input)
    # ruleid: elixir-sql-injection
    Repo.query("select * from t where name = " <> user_input)
    # ruleid: elixir-sql-injection
    Ecto.Adapters.SQL.query(Repo, "select * from t where x = " <> user_input)
    # ruleid: elixir-sql-injection
    q = user_input; Repo.query("select * from t where id = " <> q)
  end

  def safe do
    # ok: elixir-sql-injection
    Ecto.Adapters.SQL.query(Repo, "select * from users where id = 1")
    # ok: elixir-sql-injection
    Repo.query("select * from users")
    # ok: elixir-sql-injection
    Repo.query("select * from users where id = $1", [1])
  end
end
