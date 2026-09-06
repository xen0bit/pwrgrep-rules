# CWE-22: Path Traversal via File.read(Path.join)
defmodule Fixture.CWE22b do
  def vuln1(conn) do
    user = conn.params["file"]
    # ruleid: elixir-path-traversal
    File.read(Path.join("/tmp", user))
  end

  def vuln2(conn) do
    path = conn.query_params["path"]
    # ruleid: elixir-path-traversal
    File.read!(Path.join("/data", path))
  end

  def vuln3(conn) do
    name = conn.params["name"]
    p = Path.join("/srv", name)
    # ruleid: elixir-path-traversal
    File.read(p)
  end

  def safe do
    # ok: elixir-path-traversal
    File.read("/tmp/fixed.txt")
  end

  def safe2 do
    # ok: elixir-path-traversal
    File.read(Path.join("/tmp", "fixed.txt"))
  end
end
