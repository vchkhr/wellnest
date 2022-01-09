require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Gender.create(name: 'Male')
    Gender.create(name: 'Female')

    Problem.create(name: 'Anxiety')
    Problem.create(name: 'Depression')
    Problem.create(name: 'Irritability')
    Problem.create(name: 'Stress')

    @user = User.create!(name: 'Ann Albertson', email: 'ann@albertson.com', password: 'abc12345')
    @client = Client.create!(age: 30, user: @user, gender: Gender.find_by_name('Female'), problems: [Problem.find_by_name('Depression'), Problem.find_by_name('Irritability'), Problem.find_by_name('Stress')])
  end

  test "should create client" do
    if @client.valid?
      assert true
    else
      assert false
    end
  end

  test "should show client" do
    get client_url(@client)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_url(@client)
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { age: 31, bio: 'Test bio' } }
    assert_redirected_to dashboard_url
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to root_url
  end
end
