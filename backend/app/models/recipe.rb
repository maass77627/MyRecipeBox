require 'pry'

class Recipe < ActiveRecord::Base

belongs_to :category



# def self.find_recipes_by_category
#     Recipe.where("release_date > 2002")
# end




end