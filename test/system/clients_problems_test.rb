require "application_system_test_case"

class ClientsProblemsTest < ApplicationSystemTestCase
  setup do
    @clients_problem = clients_problems(:one)
  end

  test "visiting the index" do
    visit clients_problems_url
    assert_selector "h1", text: "Clients Problems"
  end

  test "creating a Clients problem" do
    visit clients_problems_url
    click_on "New Clients Problem"

    fill_in "Client", with: @clients_problem.client_id
    fill_in "Problem", with: @clients_problem.problem_id
    click_on "Create Clients problem"

    assert_text "Clients problem was successfully created"
    click_on "Back"
  end

  test "updating a Clients problem" do
    visit clients_problems_url
    click_on "Edit", match: :first

    fill_in "Client", with: @clients_problem.client_id
    fill_in "Problem", with: @clients_problem.problem_id
    click_on "Update Clients problem"

    assert_text "Clients problem was successfully updated"
    click_on "Back"
  end

  test "destroying a Clients problem" do
    visit clients_problems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clients problem was successfully destroyed"
  end
end
