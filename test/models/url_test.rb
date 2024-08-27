require "test_helper"

class UrlTest < ActiveSupport::TestCase
  test "should not save url without target_url" do
    url = Url.new
    assert_not url.save, "Saved the url without a target_url"
  end

  test "should save url with valid target_url" do
    url = Url.new(target_url: 'http://validurl.com', short_url: 'valid123', title: 'Valid Title')
    assert url.save, "Could not save the url with a valid target_url"
  end

  test "should fetch title" do
    url = Url.new(target_url: "http://example.com")
    url.title = fetch_title(url.target_url)
    assert_not_nil url.title, "Title was not fetched"
  end
end