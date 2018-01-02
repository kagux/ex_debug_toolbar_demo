defmodule ExDebugToolbarDemo.PageView do
  use ExDebugToolbarDemo.Web, :view

  def render("json.json", _) do
    %{status: :ok}
  end
end
