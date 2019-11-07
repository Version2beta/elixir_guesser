defmodule Guesser do
  @moduledoc """
  Documentation for Guesser.
  """

  defp div2up(x), do:
    x / 2 |> ceil()

  defp new_guess(f..l), do:
    f + div2up(l - f)

  defp guess(n, f..l, g) when l < f, do:
    guess(n, l..f, g)

  defp guess(n, f.._l, g) when g > n, do:
    guess(n, f..g, new_guess(f..g))

  defp guess(n, _f..l, g) when g < n, do:
    guess(n, g..l, new_guess(g..l))

  defp guess(n, _r, g) when g == n, do:
    g

  @spec guess(integer(), Range.t()) :: integer()
  def guess(n, f..l) when is_integer(n) do
    guess(n, f..l, div2up(l - f))
  end
end
