
class RemoveIngredientsFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :ingredients, :string
  end
end
