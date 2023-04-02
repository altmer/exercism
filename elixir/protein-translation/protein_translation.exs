defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    try do
      {:ok, rna |> String.graphemes |> Enum.chunk(3) |> decode_rna}
    rescue
      _ in ArgumentError -> {:error, "invalid RNA"}
    end
  end

  defp decode_rna([]), do: []

  defp decode_rna([codon | tail]) do
    case (codon |> Enum.join |> of_codon) do
      {:ok, "STOP"} -> []
      {:ok, protein} -> [protein | decode_rna(tail)]
      {:error, _} -> raise ArgumentError
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    case codon do
      c when c in ["UGU", "UGC"] -> {:ok, "Cysteine"}
      c when c in ["UUA", "UUG"] -> {:ok, "Leucine"}
      "AUG" -> {:ok, "Methionine"}
      c when c in ["UUU", "UUC"] -> {:ok, "Phenylalanine"}
      c when c in ["UCU", "UCC", "UCA", "UCG"] -> {:ok, "Serine"}
      "UGG" -> {:ok, "Tryptophan"}
      c when c in ["UAU", "UAC"] -> {:ok, "Tyrosine"}
      c when c in ["UAA", "UAG", "UGA"] -> {:ok, "STOP"}
      _ -> {:error, "invalid codon"}
    end
  end
end
