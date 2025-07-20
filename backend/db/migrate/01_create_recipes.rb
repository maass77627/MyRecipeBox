class CreateRecipes < ActiveRecord::Migration[4.2]
    def change
      create_table :recipes do |t|
        t.string :name
        t.string :ingredients
        t.string :directions
        t.string :category
        t.string :image
        t.integer :category_id
      end
    end
  end 