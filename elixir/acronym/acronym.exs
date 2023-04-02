defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
      |> String.split(~r/\s+/u)
      |> Enum.flat_map(&(abbreviate_word(&1)))
      |> Enum.join
  end

  defp abbreviate_word(word) do
    case uppercase_letters(word) do
      [] -> [word |> String.capitalize |> String.first]
      res -> res
    end
  end

  defp uppercase_letters(word) do
    word
      |> String.graphemes
      |> Enum.filter(&(&1 =~ ~r/^\p{Lu}$/u))
  end
end
