defmodule RealWorld.Factory do
  use ExMachina.Ecto, repo: RealWorld.Repo
  use RealWorld.Factory.UserFactory
end
