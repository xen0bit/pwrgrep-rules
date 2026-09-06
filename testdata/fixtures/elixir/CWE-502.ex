# CWE-502: Deserialization via binary_to_term
defmodule Fixture.CWE502 do
  def vuln1(data) do
    # ruleid: elixir-deserialization
    :erlang.binary_to_term(data)
  end

  def vuln2(conn) do
    payload = conn.params["data"]
    # ruleid: elixir-deserialization
    :erlang.binary_to_term(payload)
  end

  def vuln3(user_input) do
    # ruleid: elixir-deserialization
    :erlang.binary_to_term(user_input, [:safe])
  end

  def safe do
    # ok: elixir-deserialization
    :erlang.binary_to_term("fixed_binary")
  end

  def safe2 do
    # ok: elixir-deserialization
    :erlang.binary_to_term("fixed")
  end
end
