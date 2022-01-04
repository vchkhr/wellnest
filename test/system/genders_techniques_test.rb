require "application_system_test_case"

class GendersTechniquesTest < ApplicationSystemTestCase
  setup do
    @genders_technique = genders_techniques(:one)
  end

  test "visiting the index" do
    visit genders_techniques_url
    assert_selector "h1", text: "Genders Techniques"
  end

  test "creating a Genders technique" do
    visit genders_techniques_url
    click_on "New Genders Technique"

    fill_in "Gender", with: @genders_technique.gender_id
    fill_in "Technique", with: @genders_technique.technique_id
    click_on "Create Genders technique"

    assert_text "Genders technique was successfully created"
    click_on "Back"
  end

  test "updating a Genders technique" do
    visit genders_techniques_url
    click_on "Edit", match: :first

    fill_in "Gender", with: @genders_technique.gender_id
    fill_in "Technique", with: @genders_technique.technique_id
    click_on "Update Genders technique"

    assert_text "Genders technique was successfully updated"
    click_on "Back"
  end

  test "destroying a Genders technique" do
    visit genders_techniques_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Genders technique was successfully destroyed"
  end
end
