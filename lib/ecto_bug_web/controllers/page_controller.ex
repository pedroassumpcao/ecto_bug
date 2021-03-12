defmodule EctoBugWeb.PageController do
  use EctoBugWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
