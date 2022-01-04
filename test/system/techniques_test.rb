require "application_system_test_case"

class TechniquesTest < ApplicationSystemTestCase
  setup do
    @technique = techniques(:one)
  end

  test "visiting the index" do
    visit techniques_url
    assert_selector "h1", text: "Techniques"
  end

  test "creating a Technique" do
    visit techniques_url
    click_on "New Technique"

    fill_in "Age end", with: @technique.age_end
    fill_in "Age start", with: @technique.age_start
    fill_in "Description", with: @technique.description
    fill_in "Duration end", with: @technique.duration_end
    fill_in "Duration start", with: @technique.duration_start
    fill_in "Image", with: @technique.image
    fill_in "Title", with: @technique.title
    click_on "Create Technique"

    assert_text "Technique was successfully created"
    click_on "Back"
  end

  test "updating a Technique" do
    visit techniques_url
    click_on "Edit", match: :first

    fill_in "Age end", with: @technique.age_end
    fill_in "Age start", with: @technique.age_start
    fill_in "Description", with: @technique.description
    fill_in "Duration end", with: @technique.duration_end
    fill_in "Duration start", with: @technique.duration_start
    fill_in "Image", with: @technique.image
    fill_in "Title", with: @technique.title
    click_on "Update Technique"

    assert_text "Technique was successfully updated"
    click_on "Back"
  end

  test "destroying a Technique" do
    visit techniques_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Technique was successfully destroyed"
  end
end
