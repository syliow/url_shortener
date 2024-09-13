class ReportsController < ApplicationController

  # Eg: http://localhost:3000/reports/api_all_urls
  # Eg: http://localhost:3000/reports/api_index

  # Get the required data when user visits the /reports page
  def index
    # Get all the UrlClicks along with their associated Urls for the detailed table
    @clicks = UrlClick.includes(:url).order(clicked_at: :desc)

    # Group the UrlClicks by the short_url and calculate total clicks for the summary table
    @shorten_urls = Url.joins(:url_clicks)
    .select("urls.*, COUNT(url_clicks.id) as total_clicks")
    .group("urls.id")
    .order("urls.id ASC")
  end

  def api_index
    @clicks = UrlClick.includes(:url).order(clicked_at: :desc)
    render json: @clicks.map { |click|
      {
        id: click.id,
        url_id: click.url_id,
        short_url: click.url.short_url,
        city: click.city,
        region: click.region,
        country: click.country,
        clicked_at: click.clicked_at,
        ip_address: click.ip_address
      }
    }
  end

  def api_all_urls
    @urls = Url.order(:id)

    render json: @urls.map { |url|
      {
        id: url.id,
        target_url: url.target_url,
        short_url: url.short_url,
        created_at: url.created_at,
        clicks: url.clicks,
        title: url.title
      }
    }
  end
end
