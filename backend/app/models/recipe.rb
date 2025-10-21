require 'pry'

class Recipe < ActiveRecord::Base

belongs_to :category




def adjusted_title
     capitalized_words = self.name.split.map(&:capitalize).join(' ')
     self.name = capitalized_words
     self.save
end




end