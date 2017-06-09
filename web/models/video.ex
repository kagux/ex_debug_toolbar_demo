defmodule ExDebugToolbarDemo.Video do
  use ExDebugToolbarDemo.Web, :model

  schema "videos" do
    field :url, :string
    belongs_to :user, ExDebugToolbarDemo.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url])
    |> validate_required([:url])
  end
end
