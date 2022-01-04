require "test_helper"

class ClientsTechniquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clients_technique = clients_techniques(:one)
  end

  test "should get index" do
    get clients_techniques_url
    assert_response :success
  end

  test "should get new" do
    get new_clients_technique_url
    assert_response :success
  end

  test "should create clients_technique" do
    assert_difference('ClientsTechnique.count') do
      post clients_techniques_url, params: { clients_technique: { client_id: @clients_technique.client_id, technique_id: @clients_technique.technique_id } }
    end

    assert_redirected_to clients_technique_url(ClientsTechnique.last)
  end

  test "should show clients_technique" do
    get clients_technique_url(@clients_technique)
    assert_response :success
  end

  test "should get edit" do
    get edit_clients_technique_url(@clients_technique)
    assert_response :success
  end

  test "should update clients_technique" do
    patch clients_technique_url(@clients_technique), params: { clients_technique: { client_id: @clients_technique.client_id, technique_id: @clients_technique.technique_id } }
    assert_redirected_to clients_technique_url(@clients_technique)
  end

  test "should destroy clients_technique" do
    assert_difference('ClientsTechnique.count', -1) do
      delete clients_technique_url(@clients_technique)
    end

    assert_redirected_to clients_techniques_url
  end
end
