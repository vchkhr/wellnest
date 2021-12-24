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

u1 = User.create(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
c1 = Client.create(age: 30, gender: Gender.find_by_name('Female'))
c1.user = u1
c1.problems << Problem.find_by_name('Depression')

u2 = User.create(name: 'James Brown', email: 'b@b.b', password: 'b')
c2 = Coach.create(age: 36, gender: Gender.find_by_name('Male'))
c2.user = u2
c2.problems << Problem.find_by_name('Anxiety')
c2.problems << Problem.find_by_name('Depression')

c1.coaches << c2

t1 = Technique.create(title: 'Cognitive - Behavioral Therapy', description: 'Elimination of the dependence of emotions and human behavior on his thoughts.', age_start: 25, age_end: 35, duration_start: 6, duration_end: 7, likes: 124, dislikes: 12)
t1.problems << Problem.find_by_name('Depression')
t1.genders << Gender.find_by_name('Male')
t1.genders << Gender.find_by_name('Female')

t2 = Technique.create(title: 'Lifestyle changes', description: 'Eliminating the lack of control that makes people feel worse.', age_start: 30, age_end: 45, duration_start: 6, duration_end: 7, likes: 124, dislikes: 12)
t2.problems << Problem.find_by_name('Depression')
t2.problems << Problem.find_by_name('Anxiety')
t2.genders << Gender.find_by_name('Male')
t2.genders << Gender.find_by_name('Female')

puts t2.inspect
