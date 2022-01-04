require "application_system_test_case"

class ClientsTechniquesTest < ApplicationSystemTestCase
  setup do
    @clients_technique = clients_techniques(:one)
  end

  test "visiting the index" do
    visit clients_techniques_url
    assert_selector "h1", text: "Clients Techniques"
  end

  test "creating a Clients technique" do
    visit clients_techniques_url
    click_on "New Clients Technique"

    fill_in "Client", with: @clients_technique.client_id
    fill_in "Technique", with: @clients_technique.technique_id
    click_on "Create Clients technique"

    assert_text "Clients technique was successfully created"
    click_on "Back"
  end

  test "updating a Clients technique" do
    visit clients_techniques_url
    click_on "Edit", match: :first

    fill_in "Client", with: @clients_technique.client_id
    fill_in "Technique", with: @clients_technique.technique_id
    click_on "Update Clients technique"

    assert_text "Clients technique was successfully updated"
    click_on "Back"
  end

  test "destroying a Clients technique" do
    visit clients_techniques_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clients technique was successfully destroyed"
  end
end
