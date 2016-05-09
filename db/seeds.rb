# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create(username: "BabaBooey",
                   email: "b@example.com", 
                   password: "password", 
                   password_confirmation: "password")

user = User.create(username: "Steve",
                   email: "s@example.com", 
                   password: "password", 
                   password_confirmation: "password")                   
                   
user = User.create(username: "Stu",
                   email: "stu@example.com", 
                   password: "password", 
                   password_confirmation: "password")  
                   
puts user.inspect                   