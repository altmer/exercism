defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    original = pattern(base)
    Enum.filter candidates, fn(str) ->
      !same(base, str) && original == pattern(str)
    end
  end

  defp pattern(str) do
    str
    |> String.downcase
    |> String.graphemes
    |> Enum.sort
    |> Enum.join
  end

  defp same(left, right) do
    String.downcase(left) == String.downcase(right)
  end
end
