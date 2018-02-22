defmodule ScoreCardService.ScoreCardsTest do
  use ScoreCardService.DataCase

  alias ScoreCardService.ScoreCards

  describe "score_cards" do
    test "get_score_card/1 return score card with josevalim" do
      assert ScoreCards.get_score_card("josevalim") == {:ok, 8}
    end
    test "get_score_card/1 return score card with chrismccord" do
      assert ScoreCards.get_score_card("chrismccord") == {:ok, 13}
    end
  end

  describe "get_score_card_by_event_type" do
    test "get_score_card/2 return score card with josevalim & PushEvent" do
      assert ScoreCards.get_score_card("josevalim", "PushEvent") == {:ok, 5}
    end
    test "get_score_card/2 return score card with chrismccord & PushEvent" do
      assert ScoreCards.get_score_card("chrismccord", "PushEvent") == {:ok, 10}
    end
  end
end
