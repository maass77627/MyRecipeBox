require 'bundler/setup'

Bundler.require





require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/recipes.sqlite"
)

require_all 'app'

require_relative "../app/models/recipe.rb"
require_relative "../app/models/category.rb"