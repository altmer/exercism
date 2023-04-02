defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.map(&(multiplies(&1, &1, limit)))
    |> List.flatten
    |> Enum.uniq
    |> Enum.sum
  end

  defp multiplies(num, _, limit) when num >= limit, do: [0]
  defp multiplies(num, step, limit) do
    [num | multiplies(num + step, step, limit)]
  end
end
