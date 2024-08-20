# test/controllers/urls_controller_test.rb
require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should create url" do
    assert_difference("Url.count") do
      post urls_path, params: { url: { target_url: "http://example.com", short_url: "exmpl", title: "Example" } }
    end
    assert_redirected_to new_url_path(id: Url.last.id)
  end
end
