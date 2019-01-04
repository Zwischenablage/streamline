require 'test_helper'

class ParamSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @param_set = param_sets(:one)
  end

  test "should get index" do
    get param_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_param_set_url
    assert_response :success
  end

  test "should create param_set" do
    assert_difference('ParamSet.count') do
      post param_sets_url, params: { param_set: { mode: @param_set.mode, productName: @param_set.productName, productVersion: @param_set.productVersion, tuneProject: @param_set.tuneProject } }
    end

    assert_redirected_to param_set_url(ParamSet.last)
  end

  test "should show param_set" do
    get param_set_url(@param_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_param_set_url(@param_set)
    assert_response :success
  end

  test "should update param_set" do
    patch param_set_url(@param_set), params: { param_set: { mode: @param_set.mode, productName: @param_set.productName, productVersion: @param_set.productVersion, tuneProject: @param_set.tuneProject } }
    assert_redirected_to param_set_url(@param_set)
  end

  test "should destroy param_set" do
    assert_difference('ParamSet.count', -1) do
      delete param_set_url(@param_set)
    end

    assert_redirected_to param_sets_url
  end
end
