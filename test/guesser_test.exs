defmodule GuesserTest do
  use ExUnit.Case
  doctest Guesser

  test "guesses a random number" do
    n = :rand.uniform(2000) - 1000
    assert Guesser.guess(n, 1000..-1000) == n
  end
end
