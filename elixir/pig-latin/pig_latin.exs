defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split
    |> Enum.map(&translate_word(&1))
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    word
    |> add_ay_if_vowel(word |> starts_with_vowel)
    |> move_consonant_to_end_if_not
  end

  defp starts_with_vowel(word) do
    String.starts_with?(word, ["a", "e", "i", "o", "u", "yt", "xr"])
  end

  defp add_ay_if_vowel(word, true), do: {word <> "ay", true}
  defp add_ay_if_vowel(word, false), do: {word, false}

  defp move_consonant_to_end_if_not({word, true}), do: word
  defp move_consonant_to_end_if_not({word, false}) do
    try_consonants(
      word,
      ["ch", "qu", "squ", "thr", "th", "sch"]
    )
  end

  defp try_consonants(word, []) do
    String.slice(word, 1..-1) <> String.at(word, 0) <> "ay"
  end

  defp try_consonants(word, [prefix | tail]) do
    with true <- String.starts_with?(word, prefix) do
      String.replace_prefix(word, prefix, "") <> prefix <> "ay"
    else
      _ -> try_consonants(word, tail)
    end
  end
end
