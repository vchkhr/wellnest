require "test_helper"

class ProblemsTechniquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @problems_technique = problems_techniques(:one)
  end

  test "should get index" do
    get problems_techniques_url
    assert_response :success
  end

  test "should get new" do
    get new_problems_technique_url
    assert_response :success
  end

  test "should create problems_technique" do
    assert_difference('ProblemsTechnique.count') do
      post problems_techniques_url, params: { problems_technique: { problem_id: @problems_technique.problem_id, technique_id: @problems_technique.technique_id } }
    end

    assert_redirected_to problems_technique_url(ProblemsTechnique.last)
  end

  test "should show problems_technique" do
    get problems_technique_url(@problems_technique)
    assert_response :success
  end

  test "should get edit" do
    get edit_problems_technique_url(@problems_technique)
    assert_response :success
  end

  test "should update problems_technique" do
    patch problems_technique_url(@problems_technique), params: { problems_technique: { problem_id: @problems_technique.problem_id, technique_id: @problems_technique.technique_id } }
    assert_redirected_to problems_technique_url(@problems_technique)
  end

  test "should destroy problems_technique" do
    assert_difference('ProblemsTechnique.count', -1) do
      delete problems_technique_url(@problems_technique)
    end

    assert_redirected_to problems_techniques_url
  end
end
