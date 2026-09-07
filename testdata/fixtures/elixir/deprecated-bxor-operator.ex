# Deprecated bitwise XOR operator: use Bitwise.bxor/2 instead of ^^^.
defmodule Fixture.Bxor do
  def vuln(a, b) do
    # ruleid: deprecated_bxor_operator
    a ^^^ b
  end
  def vuln2(a, b) do
    # ruleid: deprecated_bxor_operator
    x = a ^^^ b
    x
  end
  def vuln3(a, b) do
    # ruleid: deprecated_bxor_operator
    (a + 1) ^^^ (b + 1)
  end
  def safe(a, b) do
    # ok: deprecated_bxor_operator
    Bitwise.bxor(a, b)
  end
  def safe2(a, b) do
    # ok: deprecated_bxor_operator
    x = Bitwise.bxor(a, b)
    x
  end
  def safe3(a, b) do
    # ok: deprecated_bxor_operator
    Bitwise.bxor(a + 1, b + 1)
  end
end
