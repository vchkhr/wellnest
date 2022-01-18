require "test_helper"

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Problem.create!(name: 'Anxiety')
    Problem.create!(name: 'Depression')
    Problem.create!(name: 'Irritability')
    Problem.create!(name: 'Stress')

    user1 = User.create!(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
    @client = Client.create!(age: 30, user: user1, gender: 'female', problems: [Problem.find_by_name('Depression'), Problem.find_by_name('Irritability'), Problem.find_by_name('Stress')])

    user2 = User.create!(name: 'James Brown', email: 'james@brown.com', password: 'abc12345')
    @coach = Coach.create!(age: 36, user: user2, gender: 'male', education: 'New York University, PhD in Psychology', work: 'Psychologist, ABC company, 12 years', licenses: 'New York / 081109, New York University, 2009', links: 'http://example.org', problems: [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')])

    @invitation = Invitation.create!(client: @client, coach: @coach, status: 0)
  end

  test "should create invitation" do
    assert @invitation.valid?
  end

  test "should show invitation" do
    get invitation_url(@invitation)
    assert_response :success
  end

  test "should update invitation" do
    patch invitation_url(@invitation), params: { invitation: { status: 1 } }
    assert_redirected_to invitation_url(@invitation)
  end

  test "should destroy invitation" do
    assert_difference('Invitation.count', -1) do
      delete invitation_url(@invitation)
    end

    assert_redirected_to dashboard_url
  end
end
