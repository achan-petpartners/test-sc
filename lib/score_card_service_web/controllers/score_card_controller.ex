defmodule ScoreCardServiceWeb.ScoreCardController do
  use ScoreCardServiceWeb, :controller

  alias ScoreCardService.ScoreCards
  alias ScoreCardService.ScoreCards.Event

  action_fallback ScoreCardServiceWeb.FallbackController

  def get_score_card(conn, %{"user" => user}) do
    with {:ok, sc} <- ScoreCards.get_score_card(user) do
      render(conn, "show_for_user.json", score_card: Map.put(%{total_score: sc}, :user, user))
    end
  end

  def get_score_card_by_event_type(conn, %{"user" => user, "event_type" => event_type}) do
    with {:ok, sc} <- ScoreCards.get_score_card(user, event_type) do
      render(conn, "show_for_user_and_type.json", score_card: Map.merge(%{total_score: sc}, %{user: user, event_type: event_type}))
    end
  end
end
