
defmodule Message do
 require Record
 Record.defrecord :message, Record.extract(:message, from_lib: "kafka/include/kafka_proto.hrl")
end

require Message
ip_address = {127,0,0,1}
port = 9092
broker = {ip_address, port}
option = {:topics, ["test"]}

{:ok, ref} = :kafka_client.start_link([broker], [option])

my_message = Message.message(key: "hello", value: "Hello from elixir", compression: 0)

message_set = [{0, my_message}]
produce_request_partitions = [{0, message_set}]
produce_request_topics = [{'test', produce_request_partitions}]


:kafka.metadata ref

:kafka_client.produce(ref, 0, 1, 100, produce_request_topics)



