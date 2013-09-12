json.array!(@entries) do |entry|
  json.extract! entry, :physical_location, :place, :mood, :took_place_at, :positive_activity
  json.url entry_url(entry, format: :json)
end
