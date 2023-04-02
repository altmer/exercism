defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    words(sentence)
      |> Enum.uniq
      |> Enum.map(&(word_with_count(&1, words(sentence))))
      |> Enum.into(%{})
  end

  defp words(sentence) do
    sentence
     |> String.downcase
     |> String.split(~r/[^[:alpha:]0-9\-]+/u)
     |> Enum.filter(&(String.strip(&1) != ""))
  end

  defp word_with_count(word, words_arr) do
    {word, word_count(word, words_arr)}
  end

  defp word_count(word, words_arr) do
    Enum.count(words_arr, &(&1 == word))
  end
end
