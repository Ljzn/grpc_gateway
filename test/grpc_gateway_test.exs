defmodule GrpcGatewayTest do
  use ExUnit.Case

  test "greets the world" do
    token = "Bearer TOKEN"

    # check nginx status
    System.cmd("systemctl", ["status", "nginx"])
    |> IO.inspect()

    {:ok, channel} = GRPC.Stub.connect("localhost:443", headers: %{"authorization" => token})
    request = Helloworld.HelloRequest.new!(name: "John")
    {:ok, reply} = Helloworld.Greeter.Stub.say_hello(channel, request)
  end
end
