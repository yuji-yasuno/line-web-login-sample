require 'test_helper'

class LineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get line_index_url
    assert_response :success
  end

end
