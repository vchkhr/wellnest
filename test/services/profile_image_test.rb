require "test_helper"

class ProfileImageTest < ActiveSupport::TestCase
  test "should return user profile image" do
    Gender.create!(name: 'Male')
    Gender.create!(name: 'Female')

    Problem.create!(name: 'Anxiety')
    Problem.create!(name: 'Depression')
    Problem.create!(name: 'Irritability')
    Problem.create!(name: 'Stress')

    user = User.create!(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
    client = Client.create!(age: 30, user: user, gender: Gender.find_by_name('Female'), problems: [Problem.find_by_name('Depression'), Problem.find_by_name('Irritability'), Problem.find_by_name('Stress')])

    unless UserManager::ProfileImage.call(user).nil?
      assert true
    else
      assert false
    end
  end
end
