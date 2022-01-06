require "application_system_test_case"

class CoachNotificationsTest < ApplicationSystemTestCase
  setup do
    @coach_notification = coach_notifications(:one)
  end

  test "visiting the index" do
    visit coach_notifications_url
    assert_selector "h1", text: "Coach Notifications"
  end

  test "creating a Coach notification" do
    visit coach_notifications_url
    click_on "New Coach Notification"

    fill_in "Coach", with: @coach_notification.coach_id
    fill_in "Text", with: @coach_notification.text
    click_on "Create Coach notification"

    assert_text "Coach notification was successfully created"
    click_on "Back"
  end

  test "updating a Coach notification" do
    visit coach_notifications_url
    click_on "Edit", match: :first

    fill_in "Coach", with: @coach_notification.coach_id
    fill_in "Text", with: @coach_notification.text
    click_on "Update Coach notification"

    assert_text "Coach notification was successfully updated"
    click_on "Back"
  end

  test "destroying a Coach notification" do
    visit coach_notifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coach notification was successfully destroyed"
  end
end
