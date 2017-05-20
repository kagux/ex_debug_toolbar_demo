defmodule ExDebugToolbarDemo.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:articles, [:user_id])

  end
end
