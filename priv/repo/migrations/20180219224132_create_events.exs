defmodule ScoreCardService.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :event_type, :string
      add :score, :integer

      timestamps()
    end

  end
end
