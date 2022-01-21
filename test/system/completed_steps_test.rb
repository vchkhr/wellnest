require "application_system_test_case"

class CompletedStepsTest < ApplicationSystemTestCase
  setup do
    @completed_step = completed_steps(:one)
  end

  test "visiting the index" do
    visit completed_steps_url
    assert_selector "h1", text: "Completed Steps"
  end

  test "creating a Completed step" do
    visit completed_steps_url
    click_on "New Completed Step"

    fill_in "Client", with: @completed_step.client_id
    fill_in "Step", with: @completed_step.step_id
    click_on "Create Completed step"

    assert_text "Completed step was successfully created"
    click_on "Back"
  end

  test "updating a Completed step" do
    visit completed_steps_url
    click_on "Edit", match: :first

    fill_in "Client", with: @completed_step.client_id
    fill_in "Step", with: @completed_step.step_id
    click_on "Update Completed step"

    assert_text "Completed step was successfully updated"
    click_on "Back"
  end

  test "destroying a Completed step" do
    visit completed_steps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Completed step was successfully destroyed"
  end
end
