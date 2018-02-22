defmodule ScoreCardServiceWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use ScoreCardServiceWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(ScoreCardServiceWeb.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :exceeded_rate_limit}) do
    conn
    |> put_status(:forbidden)
    |> render(ScoreCardServiceWeb.ErrorView, :"403")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(ScoreCardServiceWeb.ErrorView, :"404")
  end
end
