require "test_helper"

class UrlTest < ActiveSupport::TestCase
  # Test that a URL without a target_url is not saved
  test "should not save url without target_url" do
    url = Url.new
    assert_not url.save, "Saved the url without a target_url"
  end

  # Test that a URL with a valid target_url is saved
  test "should save url with valid target_url" do
    url = Url.new(target_url: 'http://validurl.com', short_url: 'valid123', title: 'Valid Title')
    assert url.save, "Could not save the url with a valid target_url"
  end

  # Test that the title is fetched for a given URL
  test "should fetch title" do
    url = Url.new(target_url: "http://example.com")
    url.fetch_title
    assert_not_nil url.title, "Title was not fetched"
  end
end