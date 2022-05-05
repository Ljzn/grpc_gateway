defmodule GrpcGatewayTest do
  use ExUnit.Case

  test "greets the world" do
    token = "Bearer TOKEN"

    # check nginx status
    System.cmd("systemctl", ["status", "nginx"])
    |> IO.inspect()

    IO.puts("request without token")

    {:ok, channel} = GRPC.Stub.connect("localhost:4000")
    request = Helloworld.HelloRequest.new!(name: "John")
    {:error, _} = Helloworld.Greeter.Stub.say_hello(channel, request)
    GRPC.Stub.disconnect(channel)

    IO.puts("request with token")

    {:ok, channel} = GRPC.Stub.connect("localhost:4000", headers: [{"x-token", token}])
    request = Helloworld.HelloRequest.new!(name: "John")
    Helloworld.Greeter.Stub.say_hello(channel, request) |> IO.inspect()
    GRPC.Stub.disconnect(channel)
  end
end
