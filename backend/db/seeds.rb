


puts "Clearing old data..."
RecipeIngredient.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
Category.destroy_all

puts "Creating categories..."
categories = {
  "Entree" => Category.create(name: "Entree"),
  "Dessert" => Category.create(name: "Dessert"),
  "Soup" => Category.create(name: "Soup"),
  "Salad" => Category.create(name: "Salad"),
  "Appetizer" => Category.create(name: "Appetizer"),
  "Misc" => Category.create(name: "Misc"),
  
}

puts "Creating ingredients..."
ingredients = [
  "Chicken",
  "Beef",
  "Lettuce",
  "Tomato",
  "Onion",
  "Garlic",
  "Butter",
  "Sugar",
  "Flour",
  "Eggs",
  "Chocolate"
].map { |name| Ingredient.create(name: name) }

puts "Creating recipes..."
r1 = Recipe.create(
  name: "Chocolate Cake",
  directions: "Mix ingredients and bake at 350°F for 30 minutes.",
  category: categories["Dessert"],
  image: "https://th.bing.com/th/id/OIP.kxFhkSZfYhxgMw4cUZFdJQHaLH?w=187&h=281&c=7&r=0&o=7&pid=1.7&rm=3"
)

r2 = Recipe.create(
  name: "Grilled Chicken Salad",
  directions: "Grill chicken, toss with lettuce and dressing.",
  category: categories["Salad"],
  image: "https://th.bing.com/th/id/OIP.wwXXRcw7foBJJ30LUFgenwHaLH?w=187&h=281&c=7&r=0&o=7&pid=1.7&rm=3"
)

r3 = Recipe.create(
  name: "Beef Stew",
  directions: "Simmer beef and vegetables for 2 hours.",
  category: categories["Soup"],
  image: "https://bing.com/th?id=OSK.2c3d3b0ea545f4abc7670fa2b2973313"
)

puts "Linking recipes and ingredients..."

r1.ingredients << Ingredient.find_by(name: "Flour")
r1.ingredients << Ingredient.find_by(name: "Eggs")
r1.ingredients << Ingredient.find_by(name: "Chocolate")
r1.ingredients << Ingredient.find_by(name: "Sugar")


r2.ingredients << Ingredient.find_by(name: "Chicken")
r2.ingredients << Ingredient.find_by(name: "Lettuce")
r2.ingredients << Ingredient.find_by(name: "Tomato")


r3.ingredients << Ingredient.find_by(name: "Beef")
r3.ingredients << Ingredient.find_by(name: "Onion")
r3.ingredients << Ingredient.find_by(name: "Garlic")

puts "✅ Done seeding!"
