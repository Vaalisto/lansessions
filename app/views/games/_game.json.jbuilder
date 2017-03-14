json.extract! game, :id, :name, :year, :platform, :created_at, :updated_at
json.url game_url(game, format: :json)
