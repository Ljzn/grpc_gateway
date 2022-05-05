defmodule GrpcGatewayTest do
  use ExUnit.Case

  test "greets the world" do
    token = "Bearer TOKEN"

    # check nginx status
    System.cmd("systemctl", ["status", "nginx"])
    |> IO.inspect()

    IO.puts("request without token")

    GRPC.Stub.connect("localhost:4000")
    |> IO.inspect()

    IO.puts("request with token")
    {:ok, channel} = GRPC.Stub.connect("localhost:4000", headers: %{"Authorization" => token})
    request = Helloworld.HelloRequest.new!(name: "John")
    {:ok, reply} = Helloworld.Greeter.Stub.say_hello(channel, request)
  end
end
