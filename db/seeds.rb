# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(:email => 'test@test.com', :password => 'password', :password_confirmation => 'password')

Gender.create(name: 'Male')
Gender.create(name: 'Female')

Problem.create(name: 'Anxiety')
Problem.create(name: 'Depression')
Problem.create(name: 'Irritability')
Problem.create(name: 'Stress')

# Testing the models

user1 = User.create!(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
client1 = Client.create(age: 30, user: user1, gender: Gender.find_by_name('Female'))
client1.problems << Problem.find_by_name('Depression')
client1.problems << Problem.find_by_name('Irritability')
client1.problems << Problem.find_by_name('Stress')

user2 = User.create!(name: 'James Brown', email: 'james@brown.com', password: 'abc12345')
coach1 = Coach.create(age: 36, user: user2, gender: Gender.find_by_name('Male'), education: 'education', work: 'work', licenses: 'licenses', links: 'http://example.org')
coach1.problems << [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')]

user3 = User.create!(name: 'Amelia Adamson', email: 'amelia@adamson.com', password: 'abc12345')
coach2 = Coach.create(age: 25, user: user3, gender: Gender.find_by_name('Female'), education: 'education', work: 'work', licenses: 'licenses', links: 'http://example.org')
coach2.problems << [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')]

user4 = User.create!(name: 'test', email: 'test@test.com', password: 'abc12345')
client2 = Client.create(age: 21, user: user4, gender: Gender.find_by_name('Female'))
client2.problems << Problem.find_by_name('Irritability')

Invitation.create!(client: client1, coach: coach1, status: 0)
client1.invitations.find_by_coach_id(coach1).delete

Invitation.create!(client: client1, coach: coach2, status: 0)
client1.invitations.find_by_coach_id(coach2).update!(status: 1)

Invitation.create!(client: client2, coach: coach1, status: 0)
client2.invitations.find_by_coach_id(coach1).update!(status: 1)

technique1 = Technique.create!(title: 'Cognitive - Behavioral Therapy', description: 'Elimination of the dependence of emotions and human behavior on his thoughts.', age_start: 25, age_end: 35, duration_start: 6, duration_end: 7, likes: 124, dislikes: 12)
technique1.problems << Problem.find_by_name('Depression')
technique1.genders << Gender.find_by_name('Male')
technique1.genders << Gender.find_by_name('Female')

client2.techniques << technique1

technique2 = Technique.create!(title: 'Lifestyle changes', description: 'Eliminating the lack of control that makes people feel worse.', age_start: 30, age_end: 45, duration_start: 6, duration_end: 7, likes: 214, dislikes: 34)
technique2.problems << Problem.find_by_name('Depression')
technique2.problems << Problem.find_by_name('Anxiety')
technique2.genders << Gender.find_by_name('Male')
technique2.genders << Gender.find_by_name('Female')

technique3 = Technique.create!(title: 'Inflammation and mood', description: 'Does a dysfunctional immune system cause inflammation in the body, leading to mood swings?', age_start: 30, age_end: 45, duration_start: 5, duration_end: 5, likes: 214, dislikes: 34)
technique3.problems << Problem.find_by_name('Depression')
technique3.genders << Gender.find_by_name('Male')
technique3.genders << Gender.find_by_name('Female')

technique4 = Technique.create!(title: 'Cognitive elaboration of the predicted future', description: 'It is necessary to complete the unfinished in the past and live in the present.', age_start: 20, age_end: 40, duration_start: 10, duration_end: 10, likes: 214, dislikes: 34)
technique4.problems << Problem.find_by_name('Depression')
technique4.genders << Gender.find_by_name('Male')
technique4.genders << Gender.find_by_name('Female')

[technique1, technique2, technique3, technique4].each do |technique|
  technique.steps << Step.create!(title: 'What is cognitive behavior therapy?', description: 'Cognitive behavioral therapy (CBT) is a type of psychotherapy. This form of therapy modifies thought patterns in order to change moods and behaviors. It\'s based on the idea that negative actions or feelings are the result of current distorted beliefs or thoughts, not unconscious forces from the past.<br>CBT is a blend of cognitive therapy and behavioral therapy. Cognitive therapy focuses on your moods and thoughts. Behavioral therapy specifically targets actions and behaviors. A therapist practicing the combined approach of CBT works with you in a to identify specific negative thought patterns and behavioral responses to challenging or stressful situations.<br>Treatment involves developing more balanced and constructive ways to respond to stressors. Ideally these new responses will help minimize or eliminate the troubling behavior or disorder.<br>The principles of CBT can also be applied outside of the therapist\'s office. Online cognitive behavioral therapy is one example. It uses the principles of CBT to help you track and manage your depression and anxiety symptoms online.')
  technique.steps << Step.create!(title: 'What should you do?', description: 'Look at this picture and do something. And when you do something, don\'t forget to do something.', image: 'https://domf5oio6qrcr.cloudfront.net/medialibrary/7813/a83db567-4c93-4ad0-af6f-72b57af7675d.jpg')
  technique.steps << Step.create!(title: 'What should you do?', description: 'Look at this picture and do something. And when you do something, don\'t forget to do something.', video_url: 'https://player.vimeo.com/external/415158674.sd.mp4?s=a05be1360154cec9520a51ed5750496b52419205&profile_id=139&oauth2_token_id=57447761')
  technique.steps << Step.create!(title: 'What should you do?', description: 'Look at this picture and do something. And when you do something, don\'t forget to do something.', audio_url: 'https://www.uclahealth.org/marc/mpeg/01_Breathing_Meditation.mp3')

  client1.techniques << technique

  if technique.id > 1
    if technique.id == 2
      CompletedStep.create!(step: technique.steps[0], client: client1)
      CompletedStep.create!(step: technique.steps[1], client: client1)
    else
      technique.steps.each do |step|
        CompletedStep.create!(step: step, client: client1)
      end
    end
  end
end

client1.notifications << Notification.create!(text: 'You changed your profile settings')
client1.notifications << Notification.create!(text: 'You have sent an invitation to coach Emily Smith')
client1.notifications << Notification.create!(text: 'Coach Emily Smith refused to become your coach')
client1.notifications << Notification.create!(text: 'You have sent an invitation to coach James Brown')
client1.notifications << Notification.create!(text: 'Coach James Brown agreed to become your coach')
client1.notifications << Notification.create!(text: 'Coach James Brown replied to the message')

client1.update!(bio: 'I feel depressed all the time. I do not want to do anything, I have no strength. I am afraid to communicate with people.')

Message.create!(client: client1, coach: coach1, from_client: false, text: 'How do you feel?')
Message.create!(client: client1, coach: coach1, from_client: true, text: 'Better now. I began to sleep better at night.')
Message.create!(client: client1, coach: coach1, from_client: false, text: 'Excellent! Here is a link to a new technique for you: coachingplatform.com/technique/123 Begin to pass it tomorrow.')
Message.create!(client: client1, coach: coach1, from_client: true, text: 'Ok. Thanks')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
