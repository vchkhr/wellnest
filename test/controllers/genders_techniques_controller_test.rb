require "test_helper"

class GendersTechniquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genders_technique = genders_techniques(:one)
  end

  test "should get index" do
    get genders_techniques_url
    assert_response :success
  end

  test "should get new" do
    get new_genders_technique_url
    assert_response :success
  end

  test "should create genders_technique" do
    assert_difference('GendersTechnique.count') do
      post genders_techniques_url, params: { genders_technique: { gender_id: @genders_technique.gender_id, technique_id: @genders_technique.technique_id } }
    end

    assert_redirected_to genders_technique_url(GendersTechnique.last)
  end

  test "should show genders_technique" do
    get genders_technique_url(@genders_technique)
    assert_response :success
  end

  test "should get edit" do
    get edit_genders_technique_url(@genders_technique)
    assert_response :success
  end

  test "should update genders_technique" do
    patch genders_technique_url(@genders_technique), params: { genders_technique: { gender_id: @genders_technique.gender_id, technique_id: @genders_technique.technique_id } }
    assert_redirected_to genders_technique_url(@genders_technique)
  end

  test "should destroy genders_technique" do
    assert_difference('GendersTechnique.count', -1) do
      delete genders_technique_url(@genders_technique)
    end

    assert_redirected_to genders_techniques_url
  end
end
