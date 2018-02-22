defmodule ScoreCardServiceWeb.ScoreCardView do
  use ScoreCardServiceWeb, :view
  alias ScoreCardServiceWeb.ScoreCardView

  def render("index.json", %{score_cards: score_cards}) do
    %{score_cards: render_many(score_cards, ScoreCardView, "score_card.json")}
  end

  def render("show_for_user.json", %{score_card: score_card}) do
    %{score_card: render_one(score_card, ScoreCardView, "score_card_user.json")}
  end

  def render("score_card_user.json", %{score_card: score_card}) do
      %{total_score: score_card.total_score,
        user: score_card.user}
  end

  def render("show_for_user_and_type.json", %{score_card: score_card}) do
    %{score_card: render_one(score_card, ScoreCardView, "score_card_for_user_and_type.json")}
  end

  def render("score_card_for_user_and_type.json", %{score_card: score_card}) do
    %{total_score: score_card.total_score,
      user: score_card.user,
      event_type: score_card.event_type}
  end
end
