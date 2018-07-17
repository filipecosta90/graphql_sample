defmodule GraphqlSample.PageController do
  use GraphqlSample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
