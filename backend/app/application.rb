
# class Application
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)

#     if req.path.match(/recipes/) && req.get?
#       newrecipes = Recipe.all.map do |recipe|
#         recipe.adjusted_title
#         recipe
#       end
#       resp.write newrecipes.to_json

#     elsif req.path.match(/recipes/) && req.post?
#       data = JSON.parse req.body.read
#       recipe = Recipe.create(
#         name: data["name"],
#         ingredients: data["ingredients"],
#         directions: data["directions"],
#         image: data["image"],
#         category_id: data["category_id"]
#       )
#       resp.write(recipe.to_json)

#     elsif req.path.match(/recipes/) && req.patch?
#       data = JSON.parse req.body.read
#       id = req.path.split("/recipes/").last
#       recipe = Recipe.find(id)
#       recipe.update(
#         name: data["name"],
#         ingredients: data["ingredients"],
#         directions: data["directions"],
#         image: data["image"],
#         category_id: data["category_id"]
#       )
#       resp.write(recipe.to_json)

#     elsif req.path.match(/categories/) && req.get?
#       resp.write Category.all.to_json

#     elsif req.path.match(/recipes/) && req.delete?
#       id = req.path.split("/recipes/").last
#       Recipe.find(id).destroy
#       resp.write({ message: "Recipe deleted successfully" }.to_json)

#     else
#       resp.status = 404
#       resp.write({ error: "Path not found" }.to_json)
#     end

#     resp.finish
#   end
# end

# require_relative '../models/recipe'
# require_relative '../models/category'
# require_relative './recipes_controller'
# require_relative './categories_controller'

class Application
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new
    resp['Content-Type'] = 'application/json'

    recipes_controller = RecipesController.new
    categories_controller = CategoriesController.new

    case
    
    when req.path == '/recipes' && req.get?
      resp.write(recipes_controller.index)
    when req.path == '/recipes' && req.post?
      data = JSON.parse(req.body.read)
      resp.write(recipes_controller.create(data))
    when req.path.match(%r{^/recipes/\d+$}) && req.patch?
      id = req.path.split('/recipes/').last
      data = JSON.parse(req.body.read)
      resp.write(recipes_controller.update(id, data))
    when req.path.match(%r{^/recipes/\d+$}) && req.delete?
      id = req.path.split('/recipes/').last
      resp.write(recipes_controller.destroy(id))

    
    when req.path == '/categories' && req.get?
      resp.write(categories_controller.index)

    else
      resp.status = 404
      resp.write({ error: 'Path not found' }.to_json)
    end

    resp.finish
  end
end
