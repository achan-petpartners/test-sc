defmodule ScoreCardService.EventsTest do
  use ScoreCardService.DataCase

  alias ScoreCardService.ScoreCards

  describe "events" do
    alias ScoreCardService.ScoreCards.Event

    test "get_score_card/1 return score card with given user" do
      assert Event.get_score("PushEvent") == 5
      assert Event.get_score("PullRequestReviewCommentEvent") == 4
      assert Event.get_score("WatchEvent") == 3
      assert Event.get_score("CreateEvent") == 2
      assert Event.get_score("DeleteEvent") == 1
      assert Event.get_score("FollowEvent") == 1
    end
  end
end
