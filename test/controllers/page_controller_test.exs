defmodule ExDebugToolbarDemo.PageControllerTest do
  use ExDebugToolbarDemo.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert conn.status == 200
  end

  test "GET /ecto", %{conn: conn} do
    conn = get conn, "/ecto"
    assert conn.status == 200
  end

  test "GET /partials", %{conn: conn} do
    conn = get conn, "/ecto"
    assert conn.status == 200
  end
end
