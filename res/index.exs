@doc """

"""

user_id = Auth.user_id

action do
  %{
    "account" => user_id &&& link_to("./users/:user", user: user_id),
    "translations" => link_to("./translations"),
  }
end

test do
  it "should respond to an authenticated user" do
    user = seed(:users)

    request do
      authenticate_as user
    end
  after conn ->
    conn
    |> assert_status(200)
    |> assert_json(%{"account" => _})
  end
end
