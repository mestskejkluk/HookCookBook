json.extract! comment, :id, :rating, :body, :user_id, :recipe_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
