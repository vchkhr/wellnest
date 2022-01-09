require "test_helper"

class CoachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    Gender.create(name: 'Male')
    Gender.create(name: 'Female')

    Problem.create(name: 'Anxiety')
    Problem.create(name: 'Depression')
    Problem.create(name: 'Irritability')
    Problem.create(name: 'Stress')

    @user = User.create!(name: 'James Brown', email: 'james@brown.com', password: 'abc12345')
    @coach = Coach.create!(age: 36, user: @user, gender: Gender.find_by_name('Male'), education: 'education', work: 'work', licenses: 'licenses', links: 'http://example.org', problems: [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')])
  end

  test "should create coach" do
    if @coach.valid?
      assert true
    else
      assert false
    end
  end

  test "should get edit" do
    get edit_coach_url(@coach)
    assert_response :success
  end

  test "should update coach" do
    patch coach_url(@coach), params: { coach: { work: "Updated work" } }
    assert_redirected_to dashboard_url
  end

  test "should destroy coach" do
    assert_difference('Coach.count', -1) do
      delete coach_url(@coach)
    end

    assert_redirected_to root_url
  end
end
