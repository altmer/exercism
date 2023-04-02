defmodule LinkedList do
  @opaque t :: map()
  @empty_list %{next: nil}
  @error_empty {:error, :empty_list}
  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    @empty_list
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    %{next: list, value: elem}
  end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(@empty_list), do: 0
  def length(list), do: 1 + LinkedList.length(list.next)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(@empty_list), do: true
  def empty?(_), do: false

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(@empty_list), do: @error_empty
  def peek(list), do: {:ok, list.value}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(@empty_list), do: @error_empty
  def tail(list), do: {:ok, list.next}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(@empty_list), do: @error_empty
  def pop(list) do
    with {:ok, tail} <- tail(list),
         {:ok, head} <- peek(list) do
      {:ok, head, tail}
    end
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    list
    |> Enum.reverse
    |> Enum.reduce(LinkedList.new(), &LinkedList.push(&2, &1))
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    with {:ok, tail} <- tail(list),
         {:ok, head} <- peek(list) do
      [head | to_list(tail)]
    else
      @error_empty -> []
    end
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    reverse(list, LinkedList.new())
  end
  defp reverse(%{next: nil}, reversed) do
    reversed
  end
  defp reverse(list, reversed) do
    {:ok, head, tail} = pop(list)
    reverse(tail, push(reversed, head))
  end
end
