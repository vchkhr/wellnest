require "application_system_test_case"

class StepsTechniquesTest < ApplicationSystemTestCase
  setup do
    @steps_technique = steps_techniques(:one)
  end

  test "visiting the index" do
    visit steps_techniques_url
    assert_selector "h1", text: "Steps Techniques"
  end

  test "creating a Steps technique" do
    visit steps_techniques_url
    click_on "New Steps Technique"

    fill_in "Step", with: @steps_technique.step_id
    fill_in "Technique", with: @steps_technique.technique_id
    click_on "Create Steps technique"

    assert_text "Steps technique was successfully created"
    click_on "Back"
  end

  test "updating a Steps technique" do
    visit steps_techniques_url
    click_on "Edit", match: :first

    fill_in "Step", with: @steps_technique.step_id
    fill_in "Technique", with: @steps_technique.technique_id
    click_on "Update Steps technique"

    assert_text "Steps technique was successfully updated"
    click_on "Back"
  end

  test "destroying a Steps technique" do
    visit steps_techniques_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Steps technique was successfully destroyed"
  end
end
