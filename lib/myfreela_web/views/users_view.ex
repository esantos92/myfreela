defmodule MyfreelaWeb.UsersView do
  use MyfreelaWeb, :view

  alias Myfreela.User

  def render("create.json", %{user: %User{id: id, name: name, email: email, inserted_at: inserted_at}}) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name,
        email: email,
        inserted_at: inserted_at
      }
    }
  end
end
