require "test_helper"

class ReportsIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:one)
    @url_click = url_clicks(:one)
  end

  test "should display reports index page" do
    # Step 1: Visit the reports index page
    get reports_url
    # Check that the response is successful
    assert_response :success

    # Step 2: Check that the tables are present
    assert_select "table#clicks", 1 # Ensure there's exactly one table with id 'clicks'
    assert_select "table#shorten_urls", 1 # Ensure there's exactly one table with id 'shorten_urls'
  end

  test "should display API index report" do
    # Step 1: Visit the API index endpoint
    get api_index_reports_url
    # Check that the response is successful
    assert_response :success

    # Step 2: Parse the JSON response
    json_response = JSON.parse(response.body)

    # Step 3: Check that the JSON response contains the correct data
    assert_equal @url_click.id, json_response.first["id"]
    assert_equal @url_click.url_id, json_response.first["url_id"]
    assert_equal @url.short_url, json_response.first["short_url"]
    assert_equal @url_click.city, json_response.first["city"]
    assert_equal @url_click.region, json_response.first["region"]
    assert_equal @url_click.country, json_response.first["country"]
    assert_equal @url_click.clicked_at.as_json, json_response.first["clicked_at"]
    assert_equal @url_click.ip_address, json_response.first["ip_address"]
  end

  test "should display API all URLs report" do
    # Step 1: Visit the API all URLs endpoint
    get api_all_urls_reports_url
    # Check that the response is successful
    assert_response :success

    # Step 2: Parse the JSON response
    json_response = JSON.parse(response.body)

    # Step 3: Check that the JSON response contains the correct data
    assert_equal @url.id, json_response.first["id"]
    assert_equal @url.target_url, json_response.first["target_url"]
    assert_equal @url.short_url, json_response.first["short_url"]
    assert_equal @url.created_at.as_json, json_response.first["created_at"]
    assert_equal @url.clicks, json_response.first["clicks"]
    assert_equal @url.title, json_response.first["title"]
  end
end
