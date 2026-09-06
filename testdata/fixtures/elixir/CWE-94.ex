# CWE-94: Code Injection – Code.eval_string with user input executes code.

defmodule Fixture.CWE94 do
  def vuln(user_input) do
    # ruleid: elixir-code-injection
    Code.eval_string(user_input)
    # ruleid: elixir-code-injection
    Code.eval_string(user_input <> "; extra")
    # ruleid: elixir-code-injection
    Code.eval_string(user_input)
    # ruleid: elixir-code-injection
    s = user_input; Code.eval_string(s)
  end

  def safe do
    # ok: elixir-code-injection
    Code.eval_string("1 + 2")
    # ok: elixir-code-injection
    Code.eval_string("fixed")
    # ok: elixir-code-injection
    Code.eval_string("hello")
  end
end
