# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Todo.create(description: "wash dishes", due_date: "2025-10-11 12:00:00")
Todo.create(description: "fold laundry", due_date: "2025-10-12 12:00:00")
Todo.create(description: "clean the house", due_date: "2025-10-13 12:00:00")
Todo.create(description: "go to the gym", due_date: "2025-10-14 12:00:00")
Todo.create(description: "buy groceries", due_date: "2025-10-15 12:00:00")
Todo.create(description: "do the dishes", due_date: "2025-10-16 12:00:00")
Todo.create(description: "take out the trash", due_date: "2025-10-17 12:00:00")
Todo.create(description: "make the bed", due_date: "2025-10-18 12:00:00")
Todo.create(description: "water the plants", due_date: "2025-10-19 12:00:00")
Todo.create(description: "make the bed", due_date: "2025-10-20 12:00:00")
Todo.create(description: "brush teeth", due_date: "2025-10-21 12:00:00")
