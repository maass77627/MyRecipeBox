


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
  "Salad" => Category.create(name: "Salad")
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
  image: "chocolate_cake.jpg"
)

r2 = Recipe.create(
  name: "Grilled Chicken Salad",
  directions: "Grill chicken, toss with lettuce and dressing.",
  category: categories["Salad"],
  image: "https://example.com/chicken_salad.jpg"
)

r3 = Recipe.create(
  name: "Beef Stew",
  directions: "Simmer beef and vegetables for 2 hours.",
  category: categories["Soup"],
  image: "https://example.com/beef_stew.jpg"
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
