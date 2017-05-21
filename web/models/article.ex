defmodule ExDebugToolbarDemo.Article do
  use ExDebugToolbarDemo.Web, :model

  schema "articles" do
    field :title, :string
    belongs_to :user, ExDebugToolbarDemo.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
