defmodule GrpcGatewayTest do
  use ExUnit.Case

  test "greets the world" do
    {:ok, channel} = GRPC.Stub.connect("localhost:50051")
  end
end
