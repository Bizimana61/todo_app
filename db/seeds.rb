# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a default user for seeding
user = User.find_or_create_by!(email: "seed@example.com") do |u|
  u.name = "Seed User"
  u.password = "Password123@"
  u.password_confirmation = "Password123@"
end

# Create todos for this user
user.todos.create_with(due_date: "2025-10-11 12:00:00", done: false).find_or_create_by!(description: "wash dishes")
user.todos.create_with(due_date: "2025-10-12 12:00:00", done: false).find_or_create_by!(description: "fold laundry")
user.todos.create_with(due_date: "2025-10-13 12:00:00", done: false).find_or_create_by!(description: "clean the house")
user.todos.create_with(due_date: "2025-10-14 12:00:00", done: false).find_or_create_by!(description: "go to the gym")
user.todos.create_with(due_date: "2025-10-15 12:00:00", done: false).find_or_create_by!(description: "buy groceries")
user.todos.create_with(due_date: "2025-10-16 12:00:00", done: false).find_or_create_by!(description: "do the dishes")
user.todos.create_with(due_date: "2025-10-17 12:00:00", done: false).find_or_create_by!(description: "take out the trash")
user.todos.create_with(due_date: "2025-10-18 12:00:00", done: false).find_or_create_by!(description: "make the bed")
user.todos.create_with(due_date: "2025-10-19 12:00:00", done: false).find_or_create_by!(description: "water the plants")
user.todos.create_with(due_date: "2025-10-20 12:00:00", done: false).find_or_create_by!(description: "make the bed (2)")
user.todos.create_with(due_date: "2025-10-21 12:00:00", done: true).find_or_create_by!(description: "brush teeth")

puts "Seeded #{user.todos.count} todos for #{user.email}"
