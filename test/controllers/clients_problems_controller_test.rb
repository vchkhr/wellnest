require "test_helper"

class ClientsProblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clients_problem = clients_problems(:one)
  end

  test "should get index" do
    get clients_problems_url
    assert_response :success
  end

  test "should get new" do
    get new_clients_problem_url
    assert_response :success
  end

  test "should create clients_problem" do
    assert_difference('ClientsProblem.count') do
      post clients_problems_url, params: { clients_problem: { client_id: @clients_problem.client_id, problem_id: @clients_problem.problem_id } }
    end

    assert_redirected_to clients_problem_url(ClientsProblem.last)
  end

  test "should show clients_problem" do
    get clients_problem_url(@clients_problem)
    assert_response :success
  end

  test "should get edit" do
    get edit_clients_problem_url(@clients_problem)
    assert_response :success
  end

  test "should update clients_problem" do
    patch clients_problem_url(@clients_problem), params: { clients_problem: { client_id: @clients_problem.client_id, problem_id: @clients_problem.problem_id } }
    assert_redirected_to clients_problem_url(@clients_problem)
  end

  test "should destroy clients_problem" do
    assert_difference('ClientsProblem.count', -1) do
      delete clients_problem_url(@clients_problem)
    end

    assert_redirected_to clients_problems_url
  end
end
