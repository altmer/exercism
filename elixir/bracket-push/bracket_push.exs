defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.graphemes
    |> Enum.reduce([], &bracket/2)
    |> Enum.empty?
  end

  defp bracket(")", ["(" | tail]) do
    tail
  end
  defp bracket("]", ["[" | tail]) do
    tail
  end
  defp bracket("}", ["{" | tail]) do
    tail
  end
  defp bracket(b, acc) do
    cond do
      String.contains?("([{", b) -> [b | acc]
      String.contains?(")]}", b) -> ["E" | acc]
      true -> acc
    end
  end
end
