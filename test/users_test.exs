defmodule RealWorld.UsersTest do
  use RealWorld.DataCase

  import RealWorld.Factory

  alias RealWorld.Users

  test "create_user/1 creates a user" do
    Users.create_user(create_user_attrs())
  end
end
