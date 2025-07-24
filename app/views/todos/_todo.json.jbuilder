json.extract! todo, :id, :todo_name, :completed, :created_at, :updated_at
json.url todo_url(todo, format: :json)
