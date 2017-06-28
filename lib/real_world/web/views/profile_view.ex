defmodule RealWorld.Web.ProfileView do
  use RealWorld.Web, :view
  alias RealWorld.Web.{ProfileView, FormatHelpers}

  def render("show.json", %{user: user, following: following}) do
    %{profile: render_one(user, ProfileView, "profile.json", following: following)}
  end

  def render("profile.json", %{profile: profile, following: following}) do
    profile
    |> Map.from_struct
    |> Map.put(:following, following)
    |> Map.take([:username, :image, :bio, :following])
    |> FormatHelpers.camelize
  end

end
