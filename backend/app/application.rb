class Application

  



def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

   if req.path.match(/recipes/) && req.get?
    newrecipes = []
    Recipe.all.each do |recipe|
      recipe.adjusted_title
      # recipe.adjusted_ingredients_text
      # recipe.adjusted_directions_text
      newrecipes << recipe
    end
    resp.write newrecipes.to_json
    #  resp.write Recipe.all.to_json

  elsif req.path.match(/recipes/) && req.post?
    data = JSON.parse req.body.read
   recipe = Recipe.create(name: data["name"], ingredients: data["ingredients"], directions: data["directions"], image: data["image"], category_id: data["category_id"])
  #  recipe = Recipe.create(name: data["name"], ingredients: data["ingredients"], directions: data["directions"], category: data["category"], image: data["image"])
   resp.write(recipe.to_json)

  elsif req.path.match(/categories/) && req.get?
    resp.write Category.all.to_json
    
   elsif req.delete?
    puts "recieved request"
    id = req.path.split("/recipes/").last
    Recipe.find(id).delete
  else
   resp.write "Path Not Found"
  end
  resp.finish
  end

end