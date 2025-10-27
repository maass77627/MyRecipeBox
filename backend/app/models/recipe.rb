require 'pry'



class Recipe < ActiveRecord::Base
     belongs_to :category

     belongs_to :category

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
   
     validates :name, presence: true
    
     validates :directions, presence: true
   
    
     def adjusted_title
       "#{name.titleize} (#{category&.name || 'Uncategorized'})"
     end
   
    
     def as_json(options = {})
       super(
         only: [:id, :name, :ingredients, :directions, :image, :category_id],
         methods: [:adjusted_title],
         include: {
           category: { only: [:id, :name] }
         }
       )
     end
   end