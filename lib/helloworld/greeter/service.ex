defmodule Helloworld.Greeter.Service do
  use GRPC.Service, name: "ping"

  rpc(:SayHello, Request, Reply)
end
