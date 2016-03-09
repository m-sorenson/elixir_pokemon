defmodule EP.PP do
	use GenServer

  def makeMove(move) do
    GenServer.cast(__MODULE__, {:move, move})
  end

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, {}, opts)
  end

  def init(_args) do
    cmd = "start_pokemon"
    port = Port.open({:spawn, cmd}, [:binary])
    {:ok, %{yellow: port}}
  end

  def handle_cast({:move, move}, state=%{yellow: port}) do
    Port.command(port, move, [])
    {:noreply, state}
  end

  def handle_info({port, {:data, buffer}}, state=%{yellow: port}) do
    image = <<"data:image/png;base64,">> <> buffer
    EP.Endpoint.broadcast! "rooms:lobby", "yellow", %{frame: image}
    {:noreply, state}
  end

end
