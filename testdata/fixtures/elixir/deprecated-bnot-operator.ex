# Deprecated bitwise NOT operator: use Bitwise.bnot/1 instead of ~~~.
defmodule Fixture.Bnot do
  def vuln(x) do
    # ruleid: deprecated_bnot_operator
    ~~~x
  end
  def vuln2(x) do
    # ruleid: deprecated_bnot_operator
    y = ~~~x
    y
  end
  def vuln3(x) do
    # ruleid: deprecated_bnot_operator
    ~~~(x + 1)
  end
  def safe(x) do
    # ok: deprecated_bnot_operator
    Bitwise.bnot(x)
  end
  def safe2(x) do
    # ok: deprecated_bnot_operator
    x = Bitwise.bnot(x)
    x
  end
  def safe3(x) do
    # ok: deprecated_bnot_operator
    Bitwise.bnot(x + 1)
  end
end
