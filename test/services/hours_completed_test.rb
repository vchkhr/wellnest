require "test_helper"

class HoursCompletedTest < ActiveSupport::TestCase
  test "should return clients hours completed" do
    Gender.create!(name: 'Male')
    Gender.create!(name: 'Female')

    Problem.create!(name: 'Anxiety')
    Problem.create!(name: 'Depression')
    Problem.create!(name: 'Irritability')
    Problem.create!(name: 'Stress')

    user1 = User.create!(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
    client1 = Client.create!(age: 30, user: user1, gender: Gender.find_by_name('Female'), problems: [Problem.find_by_name('Depression'), Problem.find_by_name('Irritability'), Problem.find_by_name('Stress')])

    technique1 = Technique.create!(title: 'Cognitive - Behavioral Therapy', description: 'Elimination of the dependence of emotions and human behavior on his thoughts.', age_start: 25, age_end: 35, duration_start: 6, duration_end: 7)
    technique1.problems << Problem.find_by_name('Depression')
    # TODO
    # technique1.genders << Gender.find_by_name('Male')
    # technique1.genders << Gender.find_by_name('Female')

    client1.techniques << technique1

    step1 = Step.create!(title: 'What is cognitive behavior therapy?', description: 'Cognitive behavioral therapy (CBT) is a type of psychotherapy. This form of therapy modifies thought patterns in order to change moods and behaviors. It\'s based on the idea that negative actions or feelings are the result of current distorted beliefs or thoughts, not unconscious forces from the past.<br>CBT is a blend of cognitive therapy and behavioral therapy. Cognitive therapy focuses on your moods and thoughts. Behavioral therapy specifically targets actions and behaviors. A therapist practicing the combined approach of CBT works with you in a to identify specific negative thought patterns and behavioral responses to challenging or stressful situations.<br>Treatment involves developing more balanced and constructive ways to respond to stressors. Ideally these new responses will help minimize or eliminate the troubling behavior or disorder.<br>The principles of CBT can also be applied outside of the therapist\'s office. Online cognitive behavioral therapy is one example. It uses the principles of CBT to help you track and manage your depression and anxiety symptoms online.')

    technique1.steps << [step1]

    CompletedStep.create!(step: step1, client: client1)

    if ClientManager::HoursCompleted.call(client1) == 6.5
      assert true
    else
      assert false
    end
  end
end
