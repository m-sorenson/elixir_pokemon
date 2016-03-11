defmodule EP.PP do
	use GenServer

  @yellow :yellow
  @red :red
  @blue :blue

  def makeMove(move) do
    GenServer.cast(@yellow, {:move, move})
    GenServer.cast(@red, {:move, move})
    GenServer.cast(@blue, {:move, move})
  end

  def start_link(args, opts \\ []) do
    GenServer.start_link(__MODULE__, args, opts)
  end

  def init(%{rom: rom_path, version: color}) do
    cmd = "start_pokemon " <> rom_path
    port = Port.open({:spawn, cmd}, [:binary])
    {:ok, %{game: port, version: color}}
  end

  def handle_cast({:move, move}, state=%{game: port}) do
    Port.command(port, move, [])
    {:noreply, state}
  end

  def handle_info({port, {:data, buffer}}, state=%{version: color}) do
    image = <<"data:image/png;base64,">> <> buffer
    EP.Endpoint.broadcast! "rooms:lobby", to_string(color), %{frame: image}
    {:noreply, state}
  end

end
