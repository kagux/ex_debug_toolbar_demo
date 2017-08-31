defmodule ExDebugToolbarDemo.User do
  use ExDebugToolbarDemo.Web, :model
  alias ExDebugToolbarDemo.{Article, Video, Image}

  schema "users" do
    field :name, :string
    has_many :articles, Article
    has_many :videos, Video
    has_many :images, Image

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
