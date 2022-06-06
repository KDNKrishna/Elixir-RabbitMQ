#This file will send a single message to queue. First thing to establish is a connection with RabbitMQ Server

{:ok, connection} = AMQP.Connection.open("amqp://guest:guest@localhost")
{:ok, channel} = AMQP.Channel.open(connection)

#Create a queue to which the message will be delivered
AMQP.Queue.declare(channel, "hello")

AMQP.Basic.publish(channel, "", "hello", "Servicehub")
IO.puts " [x] Sent 'Servicehub'"

AMQP.Connection.close(connection)
