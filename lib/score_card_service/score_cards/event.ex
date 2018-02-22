defmodule ScoreCardService.ScoreCards.Event do
  @moduledoc """
  Event is reponsible to maintain the events and their importance
  """

  def get_score("PushEvent"), do: 5
  def get_score("PullRequestReviewCommentEvent"), do: 4
  def get_score("WatchEvent"), do: 3
  def get_score("CreateEvent"), do: 2
  def get_score(_), do: 1
end
