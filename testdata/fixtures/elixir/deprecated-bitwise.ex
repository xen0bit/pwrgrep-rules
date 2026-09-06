# CWE-1035: Deprecated Bitwise usage
# use Bitwise is deprecated since Elixir 1.8, use import Bitwise instead.

defmodule Fixture.DeprecatedBitwise do
  # ruleid: deprecated_use_bitwise
  use Bitwise

  def vuln(x, y) do
    # ruleid: deprecated_use_bitwise
    use Bitwise
    x &&& y
  end
  def vuln2(x, y) do
    # ruleid: deprecated_use_bitwise
    use Bitwise
    # ruleid: deprecated_use_bitwise
    use Bitwise
    x ||| y
  end
  def safe(x, y) do
    # ok: deprecated_use_bitwise
    import Bitwise
    # ok: deprecated_use_bitwise
    x &&& y
  end
  def safe2(x, y) do
    # ok: deprecated_use_bitwise
    import Bitwise
    x ||| y
  end
end
