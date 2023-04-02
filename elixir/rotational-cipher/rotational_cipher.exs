defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist
    |> Enum.map(&(rotate_char(&1, shift)))
    |> to_string
  end

  defp rotate_char(char, shift) do
    case char do
      c when c in 97..122 -> 97 + rem((c - 97 + shift), 26)
      c when c in 65..90 -> 65 + rem((c - 65 + shift), 26)
      _ -> char
    end
  end
end
