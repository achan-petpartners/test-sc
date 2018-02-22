defmodule ScoreCardServiceWeb.Router do
  use ScoreCardServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ScoreCardServiceWeb do
    pipe_through :api
    resources "/events", EventController, except: [:new, :edit]
    get "/scorecards/:user", ScoreCardController, :get_score_card
    get "/scorecards/:user/:event_type", ScoreCardController, :get_score_card_by_event_type
  end
end
