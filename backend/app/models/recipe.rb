class Recipe < ActiveRecord::Base

belongs_to :category

attr_accessor :name, :directions, :image, :ingredients

def initialize(name)
    @name = name
    # @image = image

end




end