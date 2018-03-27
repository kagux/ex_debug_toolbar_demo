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
    conn = get conn, "/partials"
    assert conn.status == 200
  end

  test "GET /pry", %{conn: conn} do
    conn = get conn, "/pry"
    assert conn.status == 200
  end

  test "GET /js", %{conn: conn} do
    conn = get conn, "/js"
    assert conn.status == 200
  end

  test "GET /slim", %{conn: conn} do
    conn = get conn, "/slim"
    assert conn.status == 200
  end

  test "GET /json", %{conn: conn} do
    conn = get conn, "/json"
    assert conn.status == 200
  end

  test "GET /bootstrap_4", %{conn: conn} do
    conn = get conn, "/bootstrap_4"
    assert conn.status == 200
  end

  test "GET /params", %{conn: conn} do
    conn = get conn, "/params/v1?foo=bar"
    assert conn.status == 200
  end

  test "GET /error", %{conn: conn} do
    assert_error_sent 500, fn ->
      get conn, "/error"
    end
  end
end
