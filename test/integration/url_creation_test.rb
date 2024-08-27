require "test_helper"

class UrlCreationTest < ActionDispatch::IntegrationTest
  # This test checks if a new URL can be successfully created and displayed
  test "should create a new URL" do
    # Step 1: Visit the new URL creation page
    get new_url_path
    # Check that the response is successful
    assert_response :success

    # Step 2: Submit the form to create a new shortened URL
    post urls_path, params: { url: { target_url: "http://example.com" } }
    # Check that the response is a redirect
    assert_response :redirect
    # Follow the redirect to the next page
    follow_redirect!
    # Check that the response is successful
    assert_response :success

    # Step 3: Check that the success message and URLs are displayed correctly
    # Check for the success message
    assert_match "✅ URL successfully shortened!", response.body
    # Check that the original URL is displayed correctly
    assert_match "Original URL: <span class=\"font-semibold\">http://example.com</span>", response.body
    # Check that the text "Shortened URL:" is present
    assert_match "Shortened URL:", response.body
  end
end
