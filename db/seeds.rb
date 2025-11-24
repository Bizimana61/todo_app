# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create a default user for seeding
user = User.find_or_create_by!(email: "seed@example.com") do |u|
  u.name = "Seed User"
  u.password = "Password123@"
  u.password_confirmation = "Password123@"
end

# Define todos data
todos_data = [
  { description: "wash dishes", due_date: "2025-10-11 12:00:00", done: false },
  { description: "fold laundry", due_date: "2025-10-12 12:00:00", done: false },
  { description: "clean the house", due_date: "2025-10-13 12:00:00", done: false },
  { description: "go to the gym", due_date: "2025-10-14 12:00:00", done: false },
  { description: "buy groceries", due_date: "2025-10-15 12:00:00", done: false },
  { description: "do the dishes", due_date: "2025-10-16 12:00:00", done: false },
  { description: "take out the trash", due_date: "2025-10-17 12:00:00", done: false },
  { description: "make the bed", due_date: "2025-10-18 12:00:00", done: false },
  { description: "water the plants", due_date: "2025-10-19 12:00:00", done: false },
  { description: "make the bed (2)", due_date: "2025-10-20 12:00:00", done: false },
  { description: "brush teeth", due_date: "2025-10-21 12:00:00", done: true }
]

# Create todos for this user
todos_data.each do |todo_attrs|
  user.todos.find_or_create_by!(description: todo_attrs[:description]) do |todo|
    todo.due_date = todo_attrs[:due_date]
    todo.done = todo_attrs[:done]
  end
end

puts "Seeded #{user.todos.count} todos for #{user.email}"
