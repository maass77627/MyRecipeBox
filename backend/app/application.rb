class Application

#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)

#     if req.path.match(/test/) 
#       return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

#     else
#       resp.write "Path Not Found"

#     end

#     resp.finish
#   end

# end
#hello

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  # if req.path.match(/recipes/) && req.get?
  #   resp.write Recipe.all.to_json

  # elsif req.path.match(/foods/) && req.post?
  #    data = JSON.parse req.body.read
  #    food = Food.create(name: data["name"], description: data["description"], category: data["category"], calories: data["calories"], image: data["image"])
  
  #    resp.write(food.to_json)
    
  # elsif req.delete?
  #   puts "recieved request"
  #   id = req.path.split("/foods/").last
  #   Food.find(id).delete
  else
    resp.write "Path Not Found"
  end
  resp.finish
  end

end