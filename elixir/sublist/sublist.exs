defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare(_, []), do: :superlist
  def compare([], _), do: :sublist

  def compare(a, b) do
    cond do
      a === b -> :equal
      contains?(a, b) -> :superlist
      contains?(b, a) -> :sublist
      true -> :unequal
    end
  end

  defp contains?(superlist, sublist) do
    sublist_length = Enum.count(sublist)
    superlist_length = Enum.count(superlist)
    cond do
      sublist_length > superlist_length -> false
      Enum.take(superlist, sublist_length) === sublist -> true
      true ->
        [_ | tail] = superlist
        contains?(tail, sublist)
    end
  end
end
