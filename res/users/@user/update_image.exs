@doc """
Update a user
"""

param user, do: User.get(&1)

forward_to("/__images__/update", user: user, %{
  service: User,
  function: :update_image,
  model: user,
  after: {resolve("./"), user: user}
})
