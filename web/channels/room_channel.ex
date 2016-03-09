defmodule EP.RoomChannel do
	use Phoenix.Channel

  def join("rooms:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("rooms:" <> _unexpected, _message, _socket) do
    {:error, %{reason: "Your room sucks"}}
  end

  def handle_in("move", %{"key" => "right"}, socket) do
    EP.PP.makeMove("0")
    {:noreply, socket}
  end
  def handle_in("move", %{"key" => "left"}, socket) do
    EP.PP.makeMove("1")
    {:noreply, socket}
  end
  def handle_in("move", %{"key" => "up"}, socket) do
    EP.PP.makeMove("2")
    {:noreply, socket}
  end
  def handle_in("move", %{"key" => "down"}, socket) do
    EP.PP.makeMove("3")
    {:noreply, socket}
  end
  def handle_in("move", %{"key" => "a"}, socket) do
    EP.PP.makeMove("4")
    {:noreply, socket}
  end
  def handle_in("move", %{"key" => "b"}, socket) do
    EP.PP.makeMove("5")
    {:noreply, socket}
  end
  def handle_in("move", %{"key" => "select"}, socket) do
    EP.PP.makeMove("6")
    {:noreply, socket}
  end
  def handle_in("move", %{"key" => "start"}, socket) do
    EP.PP.makeMove("7")
    {:noreply, socket}
  end

end
