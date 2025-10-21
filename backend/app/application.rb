
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/recipes/) && req.get?
      newrecipes = Recipe.all.map do |recipe|
        recipe.adjusted_title
        recipe
      end
      resp.write newrecipes.to_json

    elsif req.path.match(/recipes/) && req.post?
      data = JSON.parse req.body.read
      recipe = Recipe.create(
        name: data["name"],
        ingredients: data["ingredients"],
        directions: data["directions"],
        image: data["image"],
        category_id: data["category_id"]
      )
      resp.write(recipe.to_json)

    elsif req.path.match(/recipes/) && req.patch?
      data = JSON.parse req.body.read
      id = req.path.split("/recipes/").last
      recipe = Recipe.find(id)
      recipe.update(
        name: data["name"],
        ingredients: data["ingredients"],
        directions: data["directions"],
        image: data["image"],
        category_id: data["category_id"]
      )
      resp.write(recipe.to_json)

    elsif req.path.match(/categories/) && req.get?
      resp.write Category.all.to_json

    elsif req.path.match(/recipes/) && req.delete?
      id = req.path.split("/recipes/").last
      Recipe.find(id).destroy
      resp.write({ message: "Recipe deleted successfully" }.to_json)

    else
      resp.status = 404
      resp.write({ error: "Path not found" }.to_json)
    end

    resp.finish
  end
end