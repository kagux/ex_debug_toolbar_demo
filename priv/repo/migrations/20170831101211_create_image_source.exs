defmodule ExDebugToolbarDemo.Repo.Migrations.CreateImageSource do
  use Ecto.Migration

  def change do
    create table(:image_sources, primary_key: false) do
      add :id, :uuid, primary_key: true

      timestamps()
    end
  end
end
