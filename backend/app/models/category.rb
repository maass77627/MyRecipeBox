# class Category < ActiveRecord::Base

# has_many :recipes
# validates :name, uniqueness: true
# # validates :name, presence: true




# end

class Category < ActiveRecord::Base
    has_many :recipes, dependent: :destroy
  
    validates :name, presence: true, uniqueness: true
  
    def as_json(options = {})
      super(
        only: [:id, :name],
        include: {
          recipes: { only: [:id, :name, :image, :category_id] }
        }
      )
    end
  end