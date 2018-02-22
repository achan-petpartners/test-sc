defmodule ScoreCardService.Repo.Migrations.CreateSandBox do
  use Ecto.Migration

  def change do
    create table(:sand_box) do

      timestamps()
    end

  end
end
