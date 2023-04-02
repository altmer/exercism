defmodule SecretHandshake do
  use Bitwise, only_operators: true
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> encode(code, 1, "wink")
    |> encode(code, 2, "double blink")
    |> encode(code, 4, "close your eyes")
    |> encode(code, 8, "jump")
    |> reverse(code)
  end

  defp encode(list, code, binary, phrase) do
    if (code &&& binary) != 0 do
      list ++ [phrase]
    else
      list
    end
  end

  defp reverse(list, code) do
    if (code &&& 16) != 0 do
      Enum.reverse(list)
    else
      list
    end
  end
end
