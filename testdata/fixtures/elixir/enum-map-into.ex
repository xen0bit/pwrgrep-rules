# CWE-1048: Inefficient Enum.map |> Enum.into pattern
# Use Enum.into/3 directly instead of mapping then collecting.

defmodule Fixture.EnumMapInto do
  def vuln(list, fun) do
    # ruleid: enum_map_into
    Enum.into(Enum.map(list, fun), [])
    # ruleid: enum_map_into
    Enum.map(list, fun) |> Enum.into(%{})
  end
  def vuln2(list, fun) do
    # ruleid: enum_map_into
    list |> Enum.map(fun) |> Enum.into([])
    # ruleid: enum_map_into
    Enum.into(Enum.map(list, fun), %{})
  end
  def safe(list, fun) do
    # ok: enum_map_into
    Enum.into(list, [], fun)
    # ok: enum_map_into
    Enum.map(list, fun)
  end
  def safe2(list, fun) do
    # ok: enum_map_into
    Enum.into(list, %{}, fun)
  end
end
