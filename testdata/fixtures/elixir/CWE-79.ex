# CWE-79: XSS via template
defmodule Fixture.CWE79 do
  def vuln(conn, user) do
    # ruleid: elixir-xss
    Phoenix.Controller.html(conn, user)
    # ruleid: elixir-xss
    EEx.eval_string(user)
  end
  def vuln2(conn, params) do
    # ruleid: elixir-xss
    Phoenix.Controller.html(conn, params["html"])
    # ruleid: elixir-xss
    EEx.eval_string(params["template"])
  end
  def safe(conn) do
    # ok: elixir-xss
    Phoenix.Controller.html(conn, "<p>hello</p>")
    # ok: elixir-xss
    EEx.eval_string("fixed")
  end
  def safe2(conn) do
    # ok: elixir-xss
    Phoenix.Controller.html(conn, "<div>safe</div>")
  end
end
