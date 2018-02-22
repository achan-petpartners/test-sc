defmodule ScoreCardService.GitHub.HTTPClient do
  require Logger

  @moduledoc """
    ScoreCardService.GitHub.HTTPClient gets events for a given user from https://api.github.com/users with RestFUL Api protocol
  """

  @github_url "https://api.github.com/users"

  @doc """
   return all events that are provided by github api for a given user
  """
  def get_events(username) do
    get_events_per_page("#{@github_url}/#{username}/events",  [])
  end

  defp get_events_per_page(nil, accumulator), do: accumulator

  defp get_events_per_page(next_url, accumulator) do
  Logger.debug "next_url: " <> next_url
    case HTTPoison.get(next_url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body, headers: headers}} ->
        case get_next_link(headers) do
          nil ->
            {:ok, get_events_per_page(nil, Poison.decode!(body) ++ accumulator)}
          link ->
            get_events_per_page(link.url, Poison.decode!(body) ++ accumulator)
        end
      {:ok, %HTTPoison.Response{status_code: 403, body: body}} ->
        get_events_per_page(nil,{:error, :exceeded_rate_limit})
      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        get_events_per_page(nil,{:error, :not_found})
      {:error, %HTTPoison.Error{reason: reason}}->
        get_events_per_page(nil, {:error, reason: reason})
    end

  end

  defp get_header(headers, key) do
    headers
    |> Enum.filter(fn({k, _}) -> k == key end)
    |> List.first
    |> get_link_value
  end
  defp get_link_value(nil), do: nil
  defp get_link_value(link_value), do: elem(link_value, 1)

  defp get_next_link(nil), do: nil
  defp get_next_link(headers) do
      link_header = get_header(headers, "Link")
      get_next_link(link_header)
  end
  defp get_next_link(link_header), do: ExLinkHeader.parse!(link_header).next
end
