ExUnit.start

Mix.Task.run "ecto.create", ~w(-r EP.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r EP.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(EP.Repo)

