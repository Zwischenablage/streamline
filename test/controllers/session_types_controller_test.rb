require 'test_helper'

class SessionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session_type = session_types(:one)
  end

  test "should get index" do
    get session_types_url
    assert_response :success
  end

  test "should get new" do
    get new_session_type_url
    assert_response :success
  end

  test "should create session_type" do
    assert_difference('SessionType.count') do
      post session_types_url, params: { session_type: { type: @session_type.type } }
    end

    assert_redirected_to session_type_url(SessionType.last)
  end

  test "should show session_type" do
    get session_type_url(@session_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_session_type_url(@session_type)
    assert_response :success
  end

  test "should update session_type" do
    patch session_type_url(@session_type), params: { session_type: { type: @session_type.type } }
    assert_redirected_to session_type_url(@session_type)
  end

  test "should destroy session_type" do
    assert_difference('SessionType.count', -1) do
      delete session_type_url(@session_type)
    end

    assert_redirected_to session_types_url
  end
end
