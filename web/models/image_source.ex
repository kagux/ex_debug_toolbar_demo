defmodule ExDebugToolbarDemo.ImageSource do
  use ExDebugToolbarDemo.Web, :model

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "image_sources" do
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
