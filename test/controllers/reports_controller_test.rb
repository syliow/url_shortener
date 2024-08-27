require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:one)
    @url_click = url_clicks(:one)
  end

  # Test that the index page loads successfully and contains the required tables
  test "should get index" do
    get reports_url
    assert_response :success
    assert_select 'table#clicks', 1 # Ensure there's exactly one table with id 'clicks'
    assert_select 'table#shorten_urls', 1 # Ensure there's exactly one table with id 'shorten_urls'
  end

  # Test that the API index endpoint returns the correct JSON response
  test "should get api_index" do
    get api_index_reports_url
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal @url_click.id, json_response.first['id']
    assert_equal @url_click.url_id, json_response.first['url_id']
    assert_equal @url.short_url, json_response.first['short_url']
    assert_equal @url_click.city, json_response.first['city']
    assert_equal @url_click.region, json_response.first['region']
    assert_equal @url_click.country, json_response.first['country']
    assert_equal @url_click.clicked_at.as_json, json_response.first['clicked_at']
    assert_equal @url_click.ip_address, json_response.first['ip_address']
  end

  # Test that the API all URLs endpoint returns the correct JSON response
  test "should get api_all_urls" do
    get api_all_urls_reports_url
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal @url.id, json_response.first['id']
    assert_equal @url.target_url, json_response.first['target_url']
    assert_equal @url.short_url, json_response.first['short_url']
    assert_equal @url.created_at.as_json, json_response.first['created_at']
    assert_equal @url.clicks, json_response.first['clicks']
    assert_equal @url.title, json_response.first['title']
  end
end
