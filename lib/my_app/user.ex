defmodule User do
  defstruct id: nil,
            name: nil,
            age: nil

  def get(id) do
    %__MODULE__{id: id,
                name: "Mike",
                age: 42}
  end
end
