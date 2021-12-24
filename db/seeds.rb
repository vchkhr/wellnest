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

client1 = Client.create(age: 30, gender: Gender.find_by_name('Female'))
client1.user = User.create(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
client1.problems << Problem.find_by_name('Depression')
client1.problems << Problem.find_by_name('Irritability')
client1.problems << Problem.find_by_name('Stress')

coach1 = Coach.create(age: 36, gender: Gender.find_by_name('Male'))
coach1.user = User.create(name: 'James Brown', email: 'james@brown.com', password: 'abc12345')
coach1.problems << [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')]

coach2 = Coach.create(age: 25, gender: Gender.find_by_name('Female'))
coach2.user = User.create(name: 'Amelia Adamson', email: 'b@b.b', password: 'abc12345')
coach2.problems << [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')]

Invitation.create(status: 0, client: client1, coach: coach2)

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

technique1.steps << Step.create(title: 'What is cognitive behavior therapy?', description: 'Cognitive behavioral therapy (CBT) is a type of psychotherapy. This form of therapy modifies thought patterns in order to change moods and behaviors. It\'s based on the idea that negative actions or feelings are the result of current distorted beliefs or thoughts, not unconscious forces from the past.<br>CBT is a blend of cognitive therapy and behavioral therapy. Cognitive therapy focuses on your moods and thoughts. Behavioral therapy specifically targets actions and behaviors. A therapist practicing the combined approach of CBT works with you in a to identify specific negative thought patterns and behavioral responses to challenging or stressful situations.<br>Treatment involves developing more balanced and constructive ways to respond to stressors. Ideally these new responses will help minimize or eliminate the troubling behavior or disorder.<br>The principles of CBT can also be applied outside of the therapist\'s office. Online cognitive behavioral therapy is one example. It uses the principles of CBT to help you track and manage your depression and anxiety symptoms online.')
technique1.steps << Step.create(title: 'What should you do?', description: 'Look at this picture and do something. And when you do something, don\'t forget to do something.', image_url: 'https://domf5oio6qrcr.cloudfront.net/medialibrary/7813/a83db567-4c93-4ad0-af6f-72b57af7675d.jpg')
technique1.steps << Step.create(title: 'What should you do?', description: 'Look at this picture and do something. And when you do something, don\'t forget to do something.', video_url: 'https://player.vimeo.com/external/415158674.sd.mp4?s=a05be1360154cec9520a51ed5750496b52419205&profile_id=139&oauth2_token_id=57447761')
technique1.steps << Step.create(title: 'What should you do?', description: 'Look at this picture and do something. And when you do something, don\'t forget to do something.', audio_url: 'https://www.uclahealth.org/marc/mpeg/01_Breathing_Meditation.mp3')

client1.notifications << Notification.create(description: 'You changed your profile settings')
client1.notifications << Notification.create(description: 'You have sent an invitation to coach Emily Smith')
client1.notifications << Notification.create(description: 'Coach Emily Smith refused to become your coach')
client1.notifications << Notification.create(description: 'You have sent an invitation to coach James Brown')
client1.notifications << Notification.create(description: 'Coach James Brown agreed to become your coach')
client1.notifications << Notification.create(description: 'Coach James Brown replied to the message')
