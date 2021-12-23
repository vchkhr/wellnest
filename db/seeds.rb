# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gender.create(name: 'Male')
Gender.create(name: 'Female')

Problem.create(name: 'Anxiety')
Problem.create(name: 'Depression')
Problem.create(name: 'Irritability')
Problem.create(name: 'Stress')

# Testing the models

u1 = User.create(name: 'a', email: 'a@a.a', password_hash: 'a')
c1 = Client.create(age: 20, gender_id: 1)
c1.user = u1

c1.problems << Problem.find_by_name('Irritability')

u2 = User.create(name: 'b', email: 'b@b.b', password_hash: 'b')
c2 = Coach.create(age: 30, gender: Gender.find_by_name('Female'))
c2.user = u2

c2.problems << Problem.find_by_name('Irritability')

c1.coaches << c2

u3 = User.create(name: 'c', email: 'c@c.c', password_hash: 'c')
c3 = Coach.create(age: 40, gender: Gender.find_by_name('Male'))
c3.user = u3

c3.problems << Problem.find_by_name('Anxiety')
c3.problems << Problem.find_by_name('Depression')

c1.coaches << c3

puts c1.coaches.inspect
