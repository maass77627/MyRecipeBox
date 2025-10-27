# class RecipesController
#     def index
#       recipes = Recipe.all
#       recipes.to_json(include: :category)
#     end
  
#     def create(data)
#       recipe = Recipe.create(
#         name: data['name'],
#         ingredients: data['ingredients'],
#         directions: data['directions'],
#         image: data['image'],
#         category_id: data['category_id']
#       )
  
#       if recipe.persisted?
#         { message: 'Recipe created successfully', recipe: recipe }.to_json
#       else
#         { error: 'Failed to create recipe', details: recipe.errors.full_messages }.to_json
#       end
#     end
  
#     def update(id, data)
#       recipe = Recipe.find_by(id: id)
#       return { error: 'Recipe not found' }.to_json unless recipe
  
#       if recipe.update(
#         name: data['name'],
#         ingredients: data['ingredients'],
#         directions: data['directions'],
#         image: data['image'],
#         category_id: data['category_id']
#       )
#         { message: 'Recipe updated successfully', recipe: recipe }.to_json
#       else
#         { error: 'Failed to update recipe', details: recipe.errors.full_messages }.to_json
#       end
#     end
  
#     def destroy(id)
#       recipe = Recipe.find_by(id: id)
#       return { error: 'Recipe not found' }.to_json unless recipe
  
#       recipe.destroy
#       { message: 'Recipe deleted successfully' }.to_json
#     end
#   end


  class RecipesController
    
    def index
      recipes = Recipe.all
      recipes.to_json(include: [:category, :ingredients])
    end
  
    
    def by_ingredients(ingredient_names)
      recipes = Recipe.joins(:ingredients)
                      .where(ingredients: { name: ingredient_names })
                      .distinct
  
      recipes.to_json(include: [:category, :ingredients])
    end
  
   
    def random_suggestion
      recipe = Recipe.order("RANDOM()").first
      recipe.to_json(include: [:category, :ingredients])
    end
  
    def create(data)
        recipe = Recipe.create(
          name: data["name"],
          directions: data["directions"],
          image: data["image"],
          category_id: data["category_id"]
        )
        recipe.to_json(include: :category)
      end
  
    
    def update(id, data)
      recipe = Recipe.find_by(id: id)
      return({ error: 'Recipe not found' }.to_json) unless recipe
  
      if recipe.update(
        name: data['name'],
        directions: data['directions'],
        image: data['image'],
        category_id: data['category_id']
      )
        
        if data['ingredient_ids']
          recipe.recipe_ingredients.destroy_all
          data['ingredient_ids'].each do |iid|
            RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: iid)
          end
        end
  
        {
          message: 'Recipe updated successfully',
          recipe: recipe.as_json(include: [:category, :ingredients])
        }.to_json
      else
        {
          error: 'Failed to update recipe',
          details: recipe.errors.full_messages
        }.to_json
      end
    end
  
    
    def destroy(id)
      recipe = Recipe.find_by(id: id)
      return({ error: 'Recipe not found' }.to_json) unless recipe
  
      recipe.destroy
      { message: 'Recipe deleted successfully' }.to_json
    end
  end