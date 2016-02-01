@doc """
Look up a user
"""

param user, do: User.get(&1)

action do
  %{
    "name" => user.name,
    "age" => user.age,
    "update" => link_to("./update", user: user),
    "update_image" => link_to("./update_image", user: user)
  }
end
