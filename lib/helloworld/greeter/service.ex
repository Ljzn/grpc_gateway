defmodule Helloworld.Greeter.Service do
  use GRPC.Service, name: "ping"

  rpc(:SayHello, Helloworld.HelloRequest, Helloworld.HelloReply)
end
