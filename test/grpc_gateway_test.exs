defmodule GrpcGatewayTest do
  use ExUnit.Case

  test "greets the world" do
    token = "Bearer TOKEN"

    {:ok, channel} = GRPC.Stub.connect("localhost:50051", headers: %{"authorization" => token})
    request = Helloworld.HelloRequest.new!(name: "John")
    {:ok, reply} = Helloworld.Greeter.Stub.say_hello(channel, request)

    # check nginx status
    System.cmd("systemctl", ["status", "nginx"])
    |> IO.inspect()
  end
end
