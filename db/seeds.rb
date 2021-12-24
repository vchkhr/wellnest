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

user1 = User.create(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
client1 = Client.create(age: 30, gender: Gender.find_by_name('Female'))
client1.user = user1
client1.problems << Problem.find_by_name('Depression')

user2 = User.create(name: 'James Brown', email: 'james@brown.com', password: 'abc12345')
coach1 = Coach.create(age: 36, gender: Gender.find_by_name('Male'))
coach1.user = user2
coach1.problems << [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')]

user3 = User.create(name: 'Amelia Adamson', email: 'b@b.b', password: 'abc12345')
coach2 = Coach.create(age: 25, gender: Gender.find_by_name('Female'))
coach2.user = user3
coach2.problems << [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')]

u = Invitation.create(status: 0, client: client1, coach: coach2)

technique1 = Technique.create(title: 'Cognitive - Behavioral Therapy', description: 'Elimination of the dependence of emotions and human behavior on his thoughts.', age_start: 25, age_end: 35, duration_start: 6, duration_end: 7, likes: 124, dislikes: 12)
technique1.problems << Problem.find_by_name('Depression')
technique1.genders << Gender.find_by_name('Male')
technique1.genders << Gender.find_by_name('Female')

technique2 = Technique.create(title: 'Lifestyle changes', description: 'Eliminating the lack of control that makes people feel worse.', age_start: 30, age_end: 45, duration_start: 6, duration_end: 7, likes: 214, dislikes: 34)
technique2.problems << Problem.find_by_name('Depression')
technique2.problems << Problem.find_by_name('Anxiety')
technique2.genders << Gender.find_by_name('Male')
technique2.genders << Gender.find_by_name('Female')

technique3 = Technique.create(title: 'Inflammation and mood', description: 'Does a dysfunctional immune system cause inflammation in the body, leading to mood swings?', age_start: 30, age_end: 45, duration_start: 5, duration_end: 5, likes: 214, dislikes: 34)
technique3.problems << Problem.find_by_name('Depression')
technique3.genders << Gender.find_by_name('Male')
technique3.genders << Gender.find_by_name('Female')

technique3 = Technique.create(title: 'Inflammation and mood', description: 'Does a dysfunctional immune system cause inflammation in the body, leading to mood swings?', age_start: 30, age_end: 45, duration_start: 5, duration_end: 5, likes: 214, dislikes: 34)
technique3.problems << Problem.find_by_name('Depression')
technique3.genders << Gender.find_by_name('Male')
technique3.genders << Gender.find_by_name('Female')

technique4 = Technique.create(title: 'Cognitive elaboration of the predicted future', description: 'It is necessary to complete the unfinished in the past and live in the present.', age_start: 20, age_end: 40, duration_start: 10, duration_end: 10, likes: 214, dislikes: 34)
technique4.problems << Problem.find_by_name('Depression')
technique4.genders << Gender.find_by_name('Male')
technique4.genders << Gender.find_by_name('Female')
