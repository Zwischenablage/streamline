require 'test_helper'

class StreamlineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get streamline_index_url
    assert_response :success
  end

end
