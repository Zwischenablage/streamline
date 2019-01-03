require 'test_helper'

class OeMsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oem = oems(:one)
  end

  test "should get index" do
    get oems_url
    assert_response :success
  end

  test "should get new" do
    get new_oem_url
    assert_response :success
  end

  test "should create oem" do
    assert_difference('Oem.count') do
      post oems_url, params: { oem: { name: @oem.name } }
    end

    assert_redirected_to oem_url(Oem.last)
  end

  test "should show oem" do
    get oem_url(@oem)
    assert_response :success
  end

  test "should get edit" do
    get edit_oem_url(@oem)
    assert_response :success
  end

  test "should update oem" do
    patch oem_url(@oem), params: { oem: { name: @oem.name } }
    assert_redirected_to oem_url(@oem)
  end

  test "should destroy oem" do
    assert_difference('Oem.count', -1) do
      delete oem_url(@oem)
    end

    assert_redirected_to oems_url
  end
end
