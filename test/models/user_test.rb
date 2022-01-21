require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new(email: 'test@example.com', password: 'abc12345')
    assert_not user.save
  end
end
