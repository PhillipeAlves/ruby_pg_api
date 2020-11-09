require "pg"
require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?
require_relative "models/my_table"

# ===( REWIND )=== #

def json_body(request)
  body = OpenStruct.new(JSON.parse(request.body.read))
  request.body.rewind
  body
end

# -----( API )----- #

# ===( CREATE )=== #

post '/api/data' do
  content = json_body(request).content
  print(content)
  create_data(content)
  json({ status: 201, message: 'Data created successfully.' })

end

# ===( READ )=== #

get '/api/data' do
  data = read_data.to_a
  json({ status: 200, data: data })
end

# ===( UPDATE )=== #

patch '/api/data' do
  body = json_body(request)
  id = body.id
  content = body.content
  update_data(content, id)
  json({ status: 200, message: "Data updated successfully.", id: id })
end

# ===( DELETE )=== #

delete '/api/data' do
  id = json_body(request).id
  delete_data(id)
  json({ status: 200, message: "Data deleted successfully.", id: id })
end