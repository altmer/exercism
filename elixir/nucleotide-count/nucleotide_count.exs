defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) when nucleotide in @nucleotides do
    Enum.reduce(strand, 0, fn ch, cur ->
      cond do
        !Enum.member?(@nucleotides, ch) -> raise ArgumentError
        nucleotide == ch -> cur + 1
        true -> cur
      end
    end)
  end
  def count(_, _), do: raise ArgumentError

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.map(@nucleotides, fn (ch) -> {ch, count(strand, ch)} end)
      |> Enum.into(%{})
  end
end
