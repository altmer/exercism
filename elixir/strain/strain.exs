defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([], fun), do: []

  def keep([head | tail], fun) do
    keep_head_if(
      fun.(head),
      head,
      keep(tail, fun)
    )
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard([], fun), do: []

  def discard([head | tail], fun) do
    keep_head_if(
      !fun.(head),
      head,
      discard(tail, fun)
    )
  end

  defp keep_head_if(true, head, tail) do
    [head | tail]
  end

  defp keep_head_if(false, head, tail) do
    tail
  end
end
