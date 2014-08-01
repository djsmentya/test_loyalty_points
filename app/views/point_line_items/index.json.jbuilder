json.array!(@point_line_items) do |point_line_item|
  json.extract! point_line_item, :id, :user_id, :points, :source
  json.url point_line_item_url(point_line_item, format: :json)
end
