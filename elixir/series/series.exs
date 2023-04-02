defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_, size) when size < 1 do
    []
  end
  def slices(s, size) do
    slice_if_possible(String.length(s) >= size, s, size)
  end

  def slice_if_possible(true, s, size) do
    [String.slice(s, 0, size) | slices(String.slice(s, 1..-1), size)]
  end
  def slice_if_possible(false, _, _) do
    []
  end
end
