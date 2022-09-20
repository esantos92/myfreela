defmodule MyfreelaWeb.UsersView do
  use MyfreelaWeb, :view

  alias Myfreela.User

  def render("create.json", %{user: %User{id: id, name: name, email: email, inserted_at: inserted_at}, token: token}) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name,
        email: email,
        inserted_at: inserted_at
      },
      token: token
    }
  end

  def render("show.json", %{user: %User{id: id, name: name, email: email, inserted_at: inserted_at}}) do
    %{
      id: id,
      name: name,
      email: email,
      inserted_at: inserted_at
    }
  end

  def render("sign_in.json", %{token: token, user: %User{id: id}}) do
    %{
      token: token,
      user_id: id
    }
  end
end
