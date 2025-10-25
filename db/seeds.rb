# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Todo.create_with(due_date: "2025-10-11 12:00:00", done: false).find_or_create_by!(description: "wash dishes")
Todo.create_with(due_date: "2025-10-12 12:00:00", done: false).find_or_create_by!(description: "fold laundry")
Todo.create_with(due_date: "2025-10-13 12:00:00", done: false).find_or_create_by!(description: "clean the house")
Todo.create_with(due_date: "2025-10-14 12:00:00", done: false).find_or_create_by!(description: "go to the gym")
Todo.create_with(due_date: "2025-10-15 12:00:00", done: false).find_or_create_by!(description: "buy groceries")
Todo.create_with(due_date: "2025-10-16 12:00:00", done: false).find_or_create_by!(description: "do the dishes")
Todo.create_with(due_date: "2025-10-17 12:00:00", done: false).find_or_create_by!(description: "take out the trash")
Todo.create_with(due_date: "2025-10-18 12:00:00", done: false).find_or_create_by!(description: "make the bed")
Todo.create_with(due_date: "2025-10-19 12:00:00", done: false).find_or_create_by!(description: "water the plants")
Todo.create_with(due_date: "2025-10-20 12:00:00", done: false).find_or_create_by!(description: "make the bed (2)")
Todo.create_with(due_date: "2025-10-21 12:00:00", done: true).find_or_create_by!(description: "brush teeth")