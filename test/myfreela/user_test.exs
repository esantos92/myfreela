defmodule Myfreela.UserTest do
  use Myfreela.DataCase

  alias Myfreela.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "Stuart Little Barbosa",
        email: "1little@email.com",
        password: "mice123456"
      }

      response = User.changeset(params)

      assert %Ecto.Changeset{
               action: nil,
               changes: %{
                 email: "1little@email.com",
                 name: "Stuart Little Barbosa",
                 password: "mice123456"
               },
               errors: [],
               data: %User{},
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{
        name: "Stuart Little Barbosa",
        email: "1little.email.com",
        password: "mice"
      }

      response = User.changeset(params)

      assert %Ecto.Changeset{
               action: nil,
               changes: %{
                 email: "1little.email.com",
                 name: "Stuart Little Barbosa",
                 password: "mice"
               },
               data: %User{},
               valid?: false
             } = response

      assert errors_on(response) == %{
               email: ["has invalid format"],
               password: ["should be at least 6 character(s)"]
             }
    end
  end

  describe "build" do
    test "when all params are valid, returns a user struct" do
      params = %{
        name: "Stuart Little Barbosa",
        email: "1little@email.com",
        password: "mice123456"
      }

      response = User.build(params)

      assert {:ok,
              %User{
                email: "1little@email.com",
                name: "Stuart Little Barbosa",
                password: "mice123456"
              }} = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{
        name: "Stuart Little Barbosa",
        email: "1little.email.com",
        password: "mice"
      }

      {:error, response} = User.build(params)

      assert %Ecto.Changeset{valid?: false} = response

      assert errors_on(response) == %{
        email: ["has invalid format"],
        password: ["should be at least 6 character(s)"]
      }
    end
  end
end
