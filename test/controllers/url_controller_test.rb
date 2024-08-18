require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_url_path
    assert_response :success
  end

  test "should create url" do
    post urls_path, params: { url: { target_url: "http://example.com" } }
    assert_response :success
  end

  test "should show url" do
    url = Url.create!(target_url: "http://example.com")
    get url_path(url)
    assert_response :success
  end
end
