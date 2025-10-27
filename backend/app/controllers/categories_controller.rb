class CategoriesController
    def index
      categories = Category.all
      categories.to_json(only: [:id, :name])  
    end
  end