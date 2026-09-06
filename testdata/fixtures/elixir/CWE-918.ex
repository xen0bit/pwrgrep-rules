# CWE-918: SSRF – user-controlled URL passed to HTTP client.

defmodule Fixture.CWE918 do
  def vuln(url) do
    # ruleid: elixir-ssrf
    HTTPoison.get(url)
    # ruleid: elixir-ssrf
    HTTPoison.get(url <> "/path")
  end
  def vuln2(user_url) do
    # ruleid: elixir-ssrf
    HTTPoison.get(user_url)
    # ruleid: elixir-ssrf
    HTTPoison.get(user_url <> "?q=1")
  end
  def safe do
    # ok: elixir-ssrf
    HTTPoison.get("https://example.com")
    # ok: elixir-ssrf
    HTTPoison.get("https://safe.example.com/api")
  end
  def safe2 do
    # ok: elixir-ssrf
    HTTPoison.get("https://example.com/static")
  end
end
