defmodule Receive do
@moduledoc """
Receiving messages from the queue is more complex. It works by sending Elixir messages to an Elixir process.
Whenever the client library receives a delivery from RabbitMQ,
a {:basic_deliver, payload, metadata} Elixir message is sent to the specified Elixir process.
We can then handle the payload and metadata any way we like.
In our case we will print on the screen the contents of the message.
"""
  def wait_for_messages do
    receive do
      {:basic_deliver, payload, _meta} ->
        IO.puts " [x] Received #{payload}"
        wait_for_messages()
    end
  end
end

{:ok, connection} = AMQP.Connection.open("amqp://guest:guest@localhost")
{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "hello")
AMQP.Basic.consume(channel, "hello", nil, no_ack: true)
IO.puts " [*] Waiting for messages. To exit press CTRL+C, CTRL+C"

Receive.wait_for_messages()
