@doc """
Update a user
"""

@action :replace

service = Resource.param(:service)
function = Resource.param(:function) || :update_image
model = Resource.param(:model)

{after_update, params} = case Resource.param(:after) do
  redirect when is_tuple(redirect) ->
    redirect
  redirect when is_atom(redirect) ->
    {redirect, []}
end

action do
  apply(service, function, [Input.get()])
  transition_to(after_update, params)
end

affordance do
  %{
    "input" => %{
      "image" => %{
        "type" => "url",
        "value" => model.image
      }
    }
  }
end
