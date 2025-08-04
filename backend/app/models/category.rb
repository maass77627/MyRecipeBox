class Category < ActiveRecord::Base

has_many :recipes
validates :name, uniqueness: true





end