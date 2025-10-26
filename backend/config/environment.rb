# require 'bundler/setup'

# Bundler.require

# require 'active_record'

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/recipes.sqlite"
# )

# require_all 'app'

# require_relative "../app/models/recipe.rb"
# require_relative "../app/models/category.rb"



require 'bundler/setup'
Bundler.require

require 'sinatra/activerecord'
require 'require_all'
require 'sqlite3'



ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/recipes.sqlite"
)


require_all 'app'

