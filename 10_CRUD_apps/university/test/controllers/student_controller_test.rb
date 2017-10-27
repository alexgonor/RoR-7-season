require 'test_helper'

class StudentControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get student_name_url
    assert_response :success
  end

  test "should get score" do
    get student_score_url
    assert_response :success
  end

end
