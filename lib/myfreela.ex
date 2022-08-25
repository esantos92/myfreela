defmodule Myfreela do
  alias Myfreela.User

  defdelegate create_user(params), to: User.Create, as: :call
end
