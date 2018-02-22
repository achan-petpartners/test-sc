defmodule ScoreCardService.GitHub.InMemory do

  @moduledoc """
    ScoreCardService.GitHub.InMemory keeps a pre-defined events for a given user in memory.
  """

  def get_events("josevalim") do
    resp =  [%{"type" => "PushEvent",
                "id" => "7271159815",
                "actor" => %{"login" => "josevalim"}},
             %{"type" => "WatchEvent",
                "id" => "7271159816",
               "actor" => %{"login" => "josevalim"}}]
    {:ok, resp}
  end

  def get_events("chrismccord") do
    resp = [%{"type" => "PushEvent",
              "id" => "7271159815",
              "actor" => %{"login" => "chrismccord"}},
            %{"type" => "PushEvent",
              "id" => "7271159816",
              "actor" => %{"login" => "chrismccord"}},
            %{"type" => "CreateEvent",
              "id" => "7271159817",
              "actor" => %{"login" => "chrismccord"}},
            %{"type" => "DeleteEvent",
              "id" => "7271159818",
              "actor" => %{"login" => "chrismccord"}}]
    {:ok, resp}
  end

  def get_events(_user) do
    {:ok, []}
  end
end
