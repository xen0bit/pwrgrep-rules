# Inefficient Enum.map |> Enum.join: use Enum.map_join/3 instead.
defmodule Fixture.MapJoin do
  def vuln(list, fun) do
    # ruleid: enum_map_join
    Enum.join(Enum.map(list, fun), ",")
  end
  def vuln2(list, fun) do
    # ruleid: enum_map_join
    list |> Enum.map(fun) |> Enum.join(",")
  end
  def vuln3(list, fun) do
    # ruleid: enum_map_join
    Enum.map(list, fun) |> Enum.join(",")
  end
  def safe(list, fun) do
    # ok: enum_map_join
    Enum.map_join(list, fun, ",")
  end
  def safe2(list, fun) do
    # ok: enum_map_join
    list |> Enum.map_join(fun, ",")
  end
  def safe3(list, fun) do
    # ok: enum_map_join
    Enum.map(list, fun)
  end
end
