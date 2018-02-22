defmodule ScoreCardService.ScoreCards do

  @moduledoc """
  The ScoreCards context serves as the external interfacing api
  """

  import Ecto.Query, warn: false
  alias ScoreCardService.Repo

  alias ScoreCardService.ScoreCards.Event
  alias ScoreCardService.ScoreCards.ScoreCalculator

  @github_api Application.get_env(:score_card_service, :github_api)

  defp sum_score_by_event_type([head | tail], accumulator), do: sum_score_by_event_type(tail, Event.get_score(head["type"]) + accumulator)
  defp sum_score_by_event_type([], accumulator), do: accumulator
  def sum_score([head | tail], accumulator), do: sum_score(tail, Event.get_score(head["type"]) + accumulator)
  def sum_score([], accumulator), do: accumulator

  defp get_event_for_user(user) do
    case @github_api.get_events(user) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
      Poison.decode! body
    {:ok, resp} -> {:ok, resp}
    {:error, error} -> {:error, error}
    end
  end

  @doc """
   return the total of score that is calculated with the events importance for a given user
  """
  def get_score_card(username) do
    case  @github_api.get_events(username) do
      {:ok, body} ->
        {:ok, sum_score(body, 0)}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
   return the total of score that is calculated with the events importance for a given user and given event type
  """
  def get_score_card(username, event_type) do
    case @github_api.get_events(username) do
      {:ok, body} ->
        filtered_body = Enum.filter(body, fn(e) -> e["type"] == event_type end)
        {:ok, sum_score(filtered_body, 0)}
      {:error, error}->
        {:error, error}
    end
  end
end
