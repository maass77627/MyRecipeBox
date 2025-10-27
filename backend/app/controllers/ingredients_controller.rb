class IngredientsController
    def index
      Ingredient.order(:name).to_json
    end
  end