# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Problem.create!(name: 'Anxiety')
Problem.create!(name: 'Depression')
Problem.create!(name: 'Irritability')
Problem.create!(name: 'Stress')

# Testing the models

user1 = User.create!(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345', age: 30, gender: 'female', problems: [Problem.find_by_name('Depression'), Problem.find_by_name('Irritability'), Problem.find_by_name('Stress')])

user2 = User.create!(name: 'Olivia Moore', email: 'olivia@moore.com', password: 'abc12345', age: 26, gender: 'female', problems: [Problem.find_by_name('Depression'), Problem.find_by_name('Anxiety')])

user3 = User.create!(name: 'Jessica Aldridge', email: 'jessica@aldridge.com', password: 'abc12345', age: 23, gender: 'female', problems: [Problem.find_by_name('Depression')])

coach1 = Coach.create!(name: 'James Brown', email: 'james@brown.com', password: 'abc12345', age: 36, gender: 'male', education: 'New York University, PhD in Psychology', work: 'Psychologist, ABC company, 12 years', licenses: 'New York / 081109, New York University, 2009', links: 'http://example.org', problems: [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')])

coach2 = Coach.create!(name: 'Amelia Adamson', email: 'amelia@adamson.com', password: 'abc12345', age: 25, gender: 'female', education: 'education', work: 'work', licenses: 'licenses', links: 'http://example.org', problems: [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')])

coach3 = Coach.create!(name: 'Gabriel Wilson', email: 'gabriel@wilson.com', password: 'abc12345', age: 32, gender: 'female', education: 'education', work: 'work', licenses: 'licenses', links: 'http://example.org', problems: [Problem.find_by_name('Depression')])

coach4 = Coach.create!(name: 'Leo Ellington', email: 'leo@ellington.com', password: 'abc12345', age: 31, gender: 'male', education: 'education', work: 'work', licenses: 'licenses', links: 'http://example.org', problems: [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')])

coach5 = Coach.create!(name: 'Tom Young', email: 'tom@young.com', password: 'abc12345', age: 32, gender: 'male', education: 'education', work: 'work', licenses: 'licenses', links: 'http://example.org', problems: [Problem.find_by_name('Depression')])

coach6 = Coach.create!(name: 'Scarlett Davies', email: 'scarlett@davies.com', password: 'abc12345', age: 31, gender: 'female', education: 'education', work: 'work', licenses: 'licenses', links: 'http://example.org', problems: [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')])

Invitation.create!(user: user1, coach: coach1)
Invitation.create!(user: user1, coach: coach1)
InvitationManager::DeclineInvitation.call(user1, coach1)

Invitation.create!(user: user1, coach: coach2)
InvitationManager::AcceptInvitation.call(user1, coach2)

Invitation.create!(user: user2, coach: coach1)
InvitationManager::AcceptInvitation.call(user2, coach1)

technique1 = Technique.create!(title: 'Cognitive - Behavioral Therapy', description: 'Elimination of the dependence of emotions and human behavior on his thoughts.', age_start: 25, age_end: 35, duration_start: 6, duration_end: 7, image: 'behaviour-therapy.jpg', gender: 'male')
technique1.problems << Problem.find_by_name('Depression')

user2.techniques << technique1

technique2 = Technique.create!(title: 'Lifestyle changes', description: 'Eliminating the lack of control that makes people feel worse.', age_start: 30, age_end: 45, duration_start: 6, duration_end: 7, image: 'lifestyle-changes.jpg', gender: 'female')
technique2.problems << Problem.find_by_name('Depression')
technique2.problems << Problem.find_by_name('Anxiety')

technique3 = Technique.create!(title: 'Inflammation and mood', description: 'Does a dysfunctional immune system cause inflammation in the body, leading to mood swings?', age_start: 30, age_end: 45, duration_start: 5, duration_end: 5, image: 'inflamation-and-mood.jpg', gender: 'both')
technique3.problems << Problem.find_by_name('Depression')

technique4 = Technique.create!(title: 'Cognitive elaboration of the predicted future', description: 'It is necessary to complete the unfinished in the past and live in the present.', age_start: 20, age_end: 40, duration_start: 10, duration_end: 10, gender: 'both')
technique4.problems << Problem.find_by_name('Depression')

[technique1, technique2, technique3, technique4].each do |technique|
  technique.steps << Step.create!(title: 'What is cognitive behavior therapy?', description: 'Cognitive behavioral therapy (CBT) is a type of psychotherapy. This form of therapy modifies thought patterns in order to change moods and behaviors. It\'s based on the idea that negative actions or feelings are the result of current distorted beliefs or thoughts, not unconscious forces from the past. CBT is a blend of cognitive therapy and behavioral therapy. Cognitive therapy focuses on your moods and thoughts. Behavioral therapy specifically targets actions and behaviors. A therapist practicing the combined approach of CBT works with you in a to identify specific negative thought patterns and behavioral responses to challenging or stressful situations. Treatment involves developing more balanced and constructive ways to respond to stressors. Ideally these new responses will help minimize or eliminate the troubling behavior or disorder. The principles of CBT can also be applied outside of the therapist\'s office. Online cognitive behavioral therapy is one example. It uses the principles of CBT to help you track and manage your depression and anxiety symptoms online.')
  technique.steps << Step.create!(title: 'What should you do?', description: 'Look at this picture and do something. And when you do something, don\'t forget to do something.', image: 'https://domf5oio6qrcr.cloudfront.net/medialibrary/7813/a83db567-4c93-4ad0-af6f-72b57af7675d.jpg')
  technique.steps << Step.create!(title: 'What should you do?', description: 'Look at this picture and do something. And when you do something, don\'t forget to do something.', video: 'https://player.vimeo.com/external/415158674.sd.mp4?s=a05be1360154cec9520a51ed5750496b52419205&profile_id=139&oauth2_token_id=57447761')
  technique.steps << Step.create!(title: 'What should you do?', description: 'Look at this picture and do something. And when you do something, don\'t forget to do something.', audio: 'https://www.uclahealth.org/marc/mpeg/01_Breathing_Meditation.mp3')

  user1.techniques << technique

  if technique.id > 1
    if technique.id == 2
      CompletedStep.create!(step: technique.steps[0], user: user1)
      CompletedStep.create!(step: technique.steps[1], user: user1)
    else
      technique.steps.each do |step|
        CompletedStep.create!(step: step, user: user1)
      end
    end
  end
end

Like.create!(is_like: true, user: user1, technique: technique1)
Like.create!(is_like: true, user: user2, technique: technique1)
Like.create!(is_like: false, user: user3, technique: technique1)

Notification.create!(text: 'You changed your profile settings', user: user1)
Notification.create!(text: 'You have sent an invitation to coach Emily Smith', user: user1)
Notification.create!(text: 'Coach Emily Smith refused to become your coach', user: user1)
Notification.create!(text: 'You have sent an invitation to coach James Brown', user: user1)
Notification.create!(text: 'Coach James Brown agreed to become your coach', user: user1)
Notification.create!(text: 'Coach James Brown replied to the message', user: user1)

CoachNotification.create!(text: 'Your profile has been verified by the admin', coach: coach1)
CoachNotification.create!(text: 'You have received an invitation to become a coach from a user Ann Albertson', coach: coach1)
CoachNotification.create!(text: 'You agreed to become a coach for a user Ann Albertson', coach: coach1)
CoachNotification.create!(text: 'You have recommended a Technique to a user Ann Albertson', coach: coach1)
CoachNotification.create!(text: 'Your user Olivia Moore replied to the message', coach: coach1)
CoachNotification.create!(text: 'Your user Olivia Moore has rated the Technique', coach: coach1)
CoachNotification.create!(text: 'The system has a new Technique', coach: coach1)

user1.update!(bio: 'I feel depressed all the time. I do not want to do anything, I have no strength. I am afraid to communicate with people.')
coach1.update!(bio: 'I know how to help you overcome Depression and Anxiety. I know modern techniques that work.')
