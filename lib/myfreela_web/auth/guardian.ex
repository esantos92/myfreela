defmodule MyfreelaWeb.Auth.Guardian do
  use Guardian, otp_app: :myfreela

  alias Myfreela.{Repo, User}

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> Myfreela.fetch_user()
  end

  def authenticate(%{"email" => email, "password" => password}) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, "User not found!"}
      user -> validate_password(user, password)
    end
  end

  defp validate_password(%User{password_hash: hash} = user, password) do
    case Argon2.verify_pass(password,hash) do\
      true -> create_token(user)
      false -> {:error, :unauthorized}
    end
  end

  defp create_token(user) do
    {:ok, token, _claims} = encode_and_sign(user)
    {:ok, token, user}
  end
end
