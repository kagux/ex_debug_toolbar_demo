defmodule ExDebugToolbarDemo.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:images, [:user_id])
  end
end
