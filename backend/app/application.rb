


class Application
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new
    resp['Content-Type'] = 'application/json'

    recipes_controller = RecipesController.new
    categories_controller = CategoriesController.new
    ingredients_controller = IngredientsController.new

    case
    
    when req.path == '/recipes' && req.get?
      if req.params["ingredients"]
        ingredient_list = req.params["ingredients"].split(",").map(&:strip)
        resp.write(recipes_controller.by_ingredients(ingredient_list))
      else
        resp.write(recipes_controller.index)
      end

   
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

   
    when req.path == '/dinner_suggestion' && req.get?
      resp.write(recipes_controller.random_suggestion)

    
    when req.path == '/categories' && req.get?
      resp.write(categories_controller.index)

    
    when req.path == '/ingredients' && req.get?
      resp.write(ingredients_controller.index)

    else
      resp.status = 404
      resp.write({ error: 'Path not found' }.to_json)
    end

    resp.finish
  end
end