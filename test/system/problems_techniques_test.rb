require "application_system_test_case"

class ProblemsTechniquesTest < ApplicationSystemTestCase
  setup do
    @problems_technique = problems_techniques(:one)
  end

  test "visiting the index" do
    visit problems_techniques_url
    assert_selector "h1", text: "Problems Techniques"
  end

  test "creating a Problems technique" do
    visit problems_techniques_url
    click_on "New Problems Technique"

    fill_in "Problem", with: @problems_technique.problem_id
    fill_in "Technique", with: @problems_technique.technique_id
    click_on "Create Problems technique"

    assert_text "Problems technique was successfully created"
    click_on "Back"
  end

  test "updating a Problems technique" do
    visit problems_techniques_url
    click_on "Edit", match: :first

    fill_in "Problem", with: @problems_technique.problem_id
    fill_in "Technique", with: @problems_technique.technique_id
    click_on "Update Problems technique"

    assert_text "Problems technique was successfully updated"
    click_on "Back"
  end

  test "destroying a Problems technique" do
    visit problems_techniques_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Problems technique was successfully destroyed"
  end
end
