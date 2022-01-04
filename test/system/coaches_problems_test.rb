require "application_system_test_case"

class CoachesProblemsTest < ApplicationSystemTestCase
  setup do
    @coaches_problem = coaches_problems(:one)
  end

  test "visiting the index" do
    visit coaches_problems_url
    assert_selector "h1", text: "Coaches Problems"
  end

  test "creating a Coaches problem" do
    visit coaches_problems_url
    click_on "New Coaches Problem"

    fill_in "Coach", with: @coaches_problem.coach_id
    fill_in "Problem", with: @coaches_problem.problem_id
    click_on "Create Coaches problem"

    assert_text "Coaches problem was successfully created"
    click_on "Back"
  end

  test "updating a Coaches problem" do
    visit coaches_problems_url
    click_on "Edit", match: :first

    fill_in "Coach", with: @coaches_problem.coach_id
    fill_in "Problem", with: @coaches_problem.problem_id
    click_on "Update Coaches problem"

    assert_text "Coaches problem was successfully updated"
    click_on "Back"
  end

  test "destroying a Coaches problem" do
    visit coaches_problems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coaches problem was successfully destroyed"
  end
end
