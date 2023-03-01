# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create!(name: 'Ola Dev', email: 'olasco@gmail.com', password: 'Olabs123')
user2 = User.create!(name: 'Nick Goodman', email: 'niccky@gmail.com', password: 'milLano1')
user3 = User.create!(name: 'Ariel Cam', email: 'ariella@gmail.com', password: 'Micromicro')

food1 = user1.foods.create!(name: 'Apple', price: 2500, measurement_unit: 'kg')
food2 = user1.foods.create!(name: 'Pineapple', price: 5000, measurement_unit: 'kg')