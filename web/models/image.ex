defmodule ExDebugToolbarDemo.Image do
  use ExDebugToolbarDemo.Web, :model

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "images" do
    belongs_to :user, ExDebugToolbarDemo.User, foreign_key: :user_id
    belongs_to :image_source, ExDebugToolbarDemo.ImageSource, type: Ecto.UUID

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:id])
    |> validate_required([:id])
  end
end
