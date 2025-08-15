require 'pry'

class Recipe < ActiveRecord::Base

belongs_to :category
# validates :name, :directions, :ingredients, :image, :category_id, presence: true



def adjusted_title
     capitalized_words = self.name.split.map(&:capitalize).join(' ')
     self.name = capitalized_words
     self.save
end

def adjusted_ingredients_text
 adjusted_ingredients = self.ingredients.scan(/.{1,50}/).join("<br>")
 self.ingredients = adjusted_ingredients
puts self.ingredients
 self.save
end

def adjusted_directions_text
    adjusted_directions = self.directions.scan(/.{1,50}/).join("\n")
    self.directions = adjusted_directions
    self.save
end

# def self.find_recipes_by_category
#     Recipe.where("release_date > 2002")
# end




end