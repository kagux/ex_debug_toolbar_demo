defmodule ExDebugToolbarDemo.Repo.Migrations.AddImageSourceToImages do
  use Ecto.Migration

  def change do
    alter table(:images) do
      add :image_source_id, references(:image_sources, on_delete: :delete_all, type: :uuid)
    end
  end
end
