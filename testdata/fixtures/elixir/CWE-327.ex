# CWE-327: weak crypto
defmodule Fixture.CWE327 do
  def vuln(data) do
    # ruleid: elixir-weak-crypto
    :md5.hash(data)
    # ruleid: elixir-weak-crypto
    :crypto.hash(:md5, data)
    # ruleid: elixir-weak-crypto
    :crypto.hash(:sha1, data)
  end
  def safe(data) do
    # ok: elixir-weak-crypto
    :crypto.hash(:sha256, data)
    # ok: elixir-weak-crypto
    :crypto.hash(:sha3_256, data)
  end
end
