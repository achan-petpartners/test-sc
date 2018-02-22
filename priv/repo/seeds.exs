# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ScoreCardService.Repo.insert!(%ScoreCardService.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
import Ecto.Query

ScoreCardService.Repo.insert!(%ScoreCardService.ScoreCards.Event{event_type: "PushEvent", score: 5})
ScoreCardService.Repo.insert!(%ScoreCardService.ScoreCards.Event{event_type: "PullRequestReviewCommentEvent", score: 4})
ScoreCardService.Repo.insert!(%ScoreCardService.ScoreCards.Event{event_type: "WatchEvent", score: 3})
ScoreCardService.Repo.insert!(%ScoreCardService.ScoreCards.Event{event_type: "CreateEvent", score: 2})
ScoreCardService.Repo.insert!(%ScoreCardService.ScoreCards.Event{event_type: nil, score: 1})