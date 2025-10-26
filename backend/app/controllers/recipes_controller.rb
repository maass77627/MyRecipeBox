class RecipesController
    def index
      recipes = Recipe.all
      recipes.to_json(include: :category)
    end
  
    def create(data)
      recipe = Recipe.create(
        name: data['name'],
        ingredients: data['ingredients'],
        directions: data['directions'],
        image: data['image'],
        category_id: data['category_id']
      )
  
      if recipe.persisted?
        { message: 'Recipe created successfully', recipe: recipe }.to_json
      else
        { error: 'Failed to create recipe', details: recipe.errors.full_messages }.to_json
      end
    end
  
    def update(id, data)
      recipe = Recipe.find_by(id: id)
      return { error: 'Recipe not found' }.to_json unless recipe
  
      if recipe.update(
        name: data['name'],
        ingredients: data['ingredients'],
        directions: data['directions'],
        image: data['image'],
        category_id: data['category_id']
      )
        { message: 'Recipe updated successfully', recipe: recipe }.to_json
      else
        { error: 'Failed to update recipe', details: recipe.errors.full_messages }.to_json
      end
    end
  
    def destroy(id)
      recipe = Recipe.find_by(id: id)
      return { error: 'Recipe not found' }.to_json unless recipe
  
      recipe.destroy
      { message: 'Recipe deleted successfully' }.to_json
    end
  end