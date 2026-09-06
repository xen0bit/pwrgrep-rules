# CWE-78: OS Command Injection – user input passed to System.cmd/shell
# allows arbitrary command execution. Literals are safe.

defmodule Fixture.CWE78 do
  def vuln(user_input) do
    # ruleid: elixir-command-injection
    System.cmd(user_input, ["-la"])
    # ruleid: elixir-command-injection
    System.shell(user_input)
    # ruleid: elixir-command-injection
    System.cmd(user_input, ["arg"])
    # ruleid: elixir-command-injection
    cmd = user_input; System.shell(cmd)
  end

  def safe do
    # ok: elixir-command-injection
    System.cmd("ls", ["-la"])
    # ok: elixir-command-injection
    System.shell("echo hi")
    # ok: elixir-command-injection
    System.cmd("echo", ["fixed"])
  end
end
