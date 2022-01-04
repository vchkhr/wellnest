require "test_helper"

class StepsTechniquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @steps_technique = steps_techniques(:one)
  end

  test "should get index" do
    get steps_techniques_url
    assert_response :success
  end

  test "should get new" do
    get new_steps_technique_url
    assert_response :success
  end

  test "should create steps_technique" do
    assert_difference('StepsTechnique.count') do
      post steps_techniques_url, params: { steps_technique: { step_id: @steps_technique.step_id, technique_id: @steps_technique.technique_id } }
    end

    assert_redirected_to steps_technique_url(StepsTechnique.last)
  end

  test "should show steps_technique" do
    get steps_technique_url(@steps_technique)
    assert_response :success
  end

  test "should get edit" do
    get edit_steps_technique_url(@steps_technique)
    assert_response :success
  end

  test "should update steps_technique" do
    patch steps_technique_url(@steps_technique), params: { steps_technique: { step_id: @steps_technique.step_id, technique_id: @steps_technique.technique_id } }
    assert_redirected_to steps_technique_url(@steps_technique)
  end

  test "should destroy steps_technique" do
    assert_difference('StepsTechnique.count', -1) do
      delete steps_technique_url(@steps_technique)
    end

    assert_redirected_to steps_techniques_url
  end
end
