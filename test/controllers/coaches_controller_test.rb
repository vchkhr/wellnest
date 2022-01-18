require "test_helper"

class CoachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    Problem.create!(name: 'Anxiety')
    Problem.create!(name: 'Depression')
    Problem.create!(name: 'Irritability')
    Problem.create!(name: 'Stress')

    user = User.create!(name: 'James Brown', email: 'james@brown.com', password: 'abc12345')
    @coach = Coach.create!(age: 36, user: user, gender: 'male', education: 'New York University, PhD in Psychology', work: 'Psychologist, ABC company, 12 years', licenses: 'New York / 081109, New York University, 2009', links: 'http://example.org', problems: [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')])
  end

  test "should create coach" do
    assert @coach.valid?
  end

  test "should show coaches" do
    get coach_url(@coach)
    assert_response :success
  end

  test "should get edit" do
    get edit_coach_url(@coach)
    assert_response :success
  end

  test "should update coach" do
    patch coach_url(@coach), params: { coach: { work: "Updated work", bio: 'Test bio', problem_ids: ['1'] } }
    assert_redirected_to dashboard_url
  end

  test "should destroy coach" do
    assert_difference('Coach.count', -1) do
      delete coach_url(@coach)
    end

    assert_redirected_to root_url
  end
end
