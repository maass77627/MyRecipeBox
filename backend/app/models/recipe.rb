require 'pry'

class Recipe < ActiveRecord::Base

belongs_to :category

# attr_accessor :name, :directions, :image, :ingredients

# def initialize(name)
#     @name = name
#     # @image = image

# end

# def capitalize
#     capitalized = self.name.split.map(&:capitalize).join(' ')
#     puts capitalized
#     capitalized
# end

# def self.find_recipes_by_category
#     Recipe.where("release_date > 2002")
# end




end