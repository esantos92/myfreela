# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Myfreela.Repo.insert!(%Myfreela.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

user_params= %{name: "Erisvaldo Mascarenhas Tortorelo", email: "valdo_masca123@email.com", password: "abc1234def"}

Myfreela.create_user(user_params)
