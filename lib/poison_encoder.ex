# lib/poison_encoder.ex
defimpl Poison.Encoder, for: Any do
  def encode(%{__struct__: _} = struct, options) do
    struct
          |> Map.from_struct
          |> sanitize_map
          |> Poison.Encoder.Map.encode(options)
  end

  defp sanitize_map(map) do
    Map.drop(map, [:__meta__, :__struct__])
  end
end
