class Category < ActiveRecord::Base

has_many :recipes

attr_accessor :name

def initialize(name)
    @name =name
end



end