json.extract! curriculum, :id, :title, :description, :capacity, :created_at, :updated_at
json.url curriculum_url(curriculum, format: :json)
