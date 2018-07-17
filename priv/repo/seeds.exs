# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GraphqlSample.Repo.insert!(%GraphqlSample.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
#
alias GraphqlSample.User
alias GraphqlSample.Post
alias GraphqlSample.Repo

Repo.insert!(%User{name: "Ryan Swapp", email: "ryan@ryan.com"})
Repo.insert!(%User{name: "Rosie", email: "rosie@mydog.com"})

for _ <- 1..10 do
  Repo.insert!(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.sentence,
    user_id: [1, 2] |> Enum.take_random(1) |> hd
  })
end
