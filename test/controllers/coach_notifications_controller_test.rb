require "test_helper"

class CoachNotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coach_notification = coach_notifications(:one)
  end

  test "should get index" do
    get coach_notifications_url
    assert_response :success
  end

  test "should get new" do
    get new_coach_notification_url
    assert_response :success
  end

  test "should create coach_notification" do
    assert_difference('CoachNotification.count') do
      post coach_notifications_url, params: { coach_notification: { coach_id: @coach_notification.coach_id, text: @coach_notification.text } }
    end

    assert_redirected_to coach_notification_url(CoachNotification.last)
  end

  test "should show coach_notification" do
    get coach_notification_url(@coach_notification)
    assert_response :success
  end

  test "should get edit" do
    get edit_coach_notification_url(@coach_notification)
    assert_response :success
  end

  test "should update coach_notification" do
    patch coach_notification_url(@coach_notification), params: { coach_notification: { coach_id: @coach_notification.coach_id, text: @coach_notification.text } }
    assert_redirected_to coach_notification_url(@coach_notification)
  end

  test "should destroy coach_notification" do
    assert_difference('CoachNotification.count', -1) do
      delete coach_notification_url(@coach_notification)
    end

    assert_redirected_to coach_notifications_url
  end
end
