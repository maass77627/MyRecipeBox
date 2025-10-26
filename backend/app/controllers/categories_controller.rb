class CategoriesController
    def index
      categories = Category.all
      categories.to_json(include: :recipes)
    end
  end