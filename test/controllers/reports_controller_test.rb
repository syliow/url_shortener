class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reports_url
    puts @response.body # Inspect what the response contains
    assert_response :success
  end
end
