require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:one)
  end

  # Test that a URL is created when a valid target_url is provided
  test "should create url when target url is provided" do
    assert_difference('Url.count') do
      post urls_url, params: { url: { target_url: "http://example.com" } }
    end

    assert_redirected_to new_url_url(id: Url.last.id)
  end

  # Test that a URL is not created when the target_url is empty
  test "should not create url with empty target url" do
    assert_no_difference('Url.count') do
      post urls_url, params: { url: { target_url: "" } }
    end

    assert_response :unprocessable_entity
  end
end