defmodule Helloworld.HelloRequest do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t()
        }

  defstruct [:name]

  field(:name, 1, type: :string)
end

defmodule Helloworld.HelloReply do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          message: String.t()
        }

  defstruct [:message]

  field(:message, 1, type: :string)
end
