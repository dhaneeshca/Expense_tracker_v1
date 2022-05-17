
json.comments(@comments) do |comment|
    json.extract! comment, :id, :message, :user, :user_id, :order
    json.url comment_url(comment, format: :json)
end
