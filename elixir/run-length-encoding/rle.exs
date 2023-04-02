defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode("") do
    ""
  end
  def encode(string) do
    head = String.at(string, 0)
    match = Regex.run(~r/#{head}+/, string) |> List.first
    tail = String.replace_prefix(string, match, "")

    "#{String.length(match)}#{head}" <> encode(tail)
  end

  @spec decode(String.t) :: String.t
  def decode("") do
    ""
  end
  def decode(string) do
    [prefix, number, letter] = Regex.run(~r/(\d+)([A-Z])/, string)
    decoded = letter |> String.duplicate(String.to_integer(number))
    tail = String.replace_prefix(string, prefix, "")

    decoded <> decode(tail)
  end
end
