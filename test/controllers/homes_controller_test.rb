require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get homes_top_url
    assert_response :success
  end

  test "should get terms" do
    get homes_terms_url
    assert_response :success
  end

  test "should get contact" do
    get homes_contact_url
    assert_response :success
  end

  test "should get aboutus" do
    get homes_aboutus_url
    assert_response :success
  end

end
