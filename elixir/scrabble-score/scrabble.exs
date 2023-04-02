defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(""), do: 0
  def score(word) do
    word
    |> String.upcase
    |> String.graphemes
    |> Enum.map(&(letter_score(&1)))
    |> Enum.reduce(&(&1 + &2))
  end

  defp letter_score(letter) do
    cond do
      "AEIOULNRST" |> String.contains?(letter) -> 1
      "DG" |> String.contains?(letter) -> 2
      "BCMP" |> String.contains?(letter) -> 3
      "FHVWY" |> String.contains?(letter) -> 4
      "K" |> String.contains?(letter) -> 5
      "JX" |> String.contains?(letter) -> 8
      "QZ" |> String.contains?(letter) -> 10
      true -> 0
    end
  end
end
