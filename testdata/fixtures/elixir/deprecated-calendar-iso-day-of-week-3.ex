# Deprecated Calendar.ISO.day_of_week/3: use Date.day_of_week/2 instead.
defmodule Fixture.IsoDay do
  def vuln(y, m, d) do
    # ruleid: deprecated_calendar_iso_day_of_week_3
    x = Calendar.ISO.day_of_week(y, m, d)
    x
  end
  def vuln2(y, m, d) do
    # ruleid: deprecated_calendar_iso_day_of_week_3
    day = Calendar.ISO.day_of_week(y, m, d)
    day
  end
  def vuln3(y, m, d) do
    # ruleid: deprecated_calendar_iso_day_of_week_3
    n = Calendar.ISO.day_of_week(2024, 1, 1)
    {n, y, m, d}
  end
  def safe(date) do
    # ok: deprecated_calendar_iso_day_of_week_3
    x = Date.day_of_week(date)
    x
  end
  def safe2(date) do
    # ok: deprecated_calendar_iso_day_of_week_3
    Date.day_of_week(date)
  end
  def safe3(y, m, d) do
    # ok: deprecated_calendar_iso_day_of_week_3
    {:ok, date} = Date.new(y, m, d)
    Date.day_of_week(date)
  end
end
