require "test_helper"

class CoachesProblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coaches_problem = coaches_problems(:one)
  end

  test "should get index" do
    get coaches_problems_url
    assert_response :success
  end

  test "should get new" do
    get new_coaches_problem_url
    assert_response :success
  end

  test "should create coaches_problem" do
    assert_difference('CoachesProblem.count') do
      post coaches_problems_url, params: { coaches_problem: { coach_id: @coaches_problem.coach_id, problem_id: @coaches_problem.problem_id } }
    end

    assert_redirected_to coaches_problem_url(CoachesProblem.last)
  end

  test "should show coaches_problem" do
    get coaches_problem_url(@coaches_problem)
    assert_response :success
  end

  test "should get edit" do
    get edit_coaches_problem_url(@coaches_problem)
    assert_response :success
  end

  test "should update coaches_problem" do
    patch coaches_problem_url(@coaches_problem), params: { coaches_problem: { coach_id: @coaches_problem.coach_id, problem_id: @coaches_problem.problem_id } }
    assert_redirected_to coaches_problem_url(@coaches_problem)
  end

  test "should destroy coaches_problem" do
    assert_difference('CoachesProblem.count', -1) do
      delete coaches_problem_url(@coaches_problem)
    end

    assert_redirected_to coaches_problems_url
  end
end
