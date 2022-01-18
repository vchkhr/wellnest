require "test_helper"

class TechniquesInProgressTest < ActiveSupport::TestCase
  test "should return techniques in progress for client" do
    Problem.create!(name: 'Anxiety')
    Problem.create!(name: 'Depression')
    Problem.create!(name: 'Irritability')
    Problem.create!(name: 'Stress')

    user1 = User.create!(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
    client1 = Client.create!(age: 30, user: user1, gender: 'female', problems: [Problem.find_by_name('Depression'), Problem.find_by_name('Irritability'), Problem.find_by_name('Stress')])

    technique1 = Technique.create!(title: 'Cognitive - Behavioral Therapy', description: 'Elimination of the dependence of emotions and human behavior on his thoughts.', age_start: 25, age_end: 35, duration_start: 6, duration_end: 7, image: 'behaviour-therapy.jpg', gender: 'both')
    technique1.problems << Problem.find_by_name('Depression')

    client1.techniques << technique1

    technique1.steps << Step.create!(title: 'step1', description: 'step1')
    technique1.steps << Step.create!(title: 'step2', description: 'step2')
    technique1.steps << Step.create!(title: 'step3', description: 'step3')
    technique1.steps << Step.create!(title: 'step4', description: 'step4')

    CompletedStep.create!(step: technique1.steps[0], client: client1)
    CompletedStep.create!(step: technique1.steps[1], client: client1)

    assert_equal [technique1], ClientManager::TechniquesInProgress.call(client1)
  end
end
