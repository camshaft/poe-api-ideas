@doc """
Update a user
"""

@action :replace

param user, do: User.get(&1)

action do
  User.update(user, Input.get())
  transition_to("./", user: user)
end

affordance do
  %{
    "input" => %{
      "name" => %{
        "type" => "text",
        "value" => user.name
      },
      "age" => %{
        "type" => "number",
        "value" => user.age
      }
    }
  }
end
