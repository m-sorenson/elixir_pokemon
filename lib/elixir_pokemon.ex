defmodule EP do
  use Application

  @yellow :yellow
  @red :red
  @blue :blue

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(EP.Endpoint, []),
      # Start the Ecto repository
      supervisor(EP.Repo, []),
      # Here you could define other workers and supervisors as children
      # worker(EP.Worker, [arg1, arg2, arg3]),
      worker(EP.PP, [%{version: @yellow, rom: "'/home/michael/Downloads/Pokemon\ Yellow.gb'"}, [name: @yellow]], [id: @yellow]),
      worker(EP.PP, [%{version: @red, rom: "'/home/michael/Downloads/Pokemon\ Red.gb'"}, [name: @red]], [id: @red]),
      worker(EP.PP, [%{version: @blue, rom: "'/home/michael/Downloads/Pokemon\ Blue.gb'"}, [name: @blue]], [id: @blue])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EP.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EP.Endpoint.config_change(changed, removed)
    :ok
  end
end
