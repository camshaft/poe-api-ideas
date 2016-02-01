@doc """
Look up a user
"""

param user, do: User.get(&1)

action do
  %{
    "name" => user.name,
    "age" => user.age
  }
end
