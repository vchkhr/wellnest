require "test_helper"

class UnconfirmedInvitationTest < ActiveSupport::TestCase
  test "should return clients unconfirmed invitation" do
    Gender.create!(name: 'Male')
    Gender.create!(name: 'Female')

    Problem.create!(name: 'Anxiety')
    Problem.create!(name: 'Depression')
    Problem.create!(name: 'Irritability')
    Problem.create!(name: 'Stress')

    user1 = User.create!(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
    client1 = Client.create!(age: 30, user: user1, gender: Gender.find_by_name('Female'), problems: [Problem.find_by_name('Depression'), Problem.find_by_name('Irritability'), Problem.find_by_name('Stress')])

    user2 = User.create!(name: 'James Brown', email: 'james@brown.com', password: 'abc12345')
    coach1 = Coach.create!(age: 36, user: user2, gender: Gender.find_by_name('Male'), education: 'education', work: 'work', licenses: 'licenses', links: 'http://example.org', problems: [Problem.find_by_name('Anxiety'), Problem.find_by_name('Depression')])

    Invitation.create!(client: client1, coach: coach1, status: 0)

    if ClientManager::UnconfirmedInvitation.call(client1).user.email == "james@brown.com"
      assert true
    else
      assert false
    end
  end
end
