defmodule RealWorld.Factory.UserFactory do
  defmacro __using__(_opts) do
    quote do
      import Comeonin.Bcrypt, only: [hashpwsalt: 1]

      alias RealWorld.Users.User

      @user_create_attrs %{email: "some email", password: "some password", username: "some username"}
      @user_invalid_attrs %{email: nil, password: nil, username: nil}
      @user_update_attrs %{email: "some updated email", password: "some updated password", username: "some updated username"}

      def user_factory do
        user = create_user_attrs()
        %User{
          email: user.email,
          password: hashpwsalt(user.password),
          username: user.username,
        }
      end

      def create_user_attrs() do
        @user_create_attrs
      end

      def update_user_attrs() do
        @user_update_attrs
      end

      def invalid_user_attrs do
        @user_invalid_attrs
      end

      def login_params() do
        %{
          username: @user_create_attrs.username,
          password: @user_create_attrs.password
        }
      end
    end
  end
end
