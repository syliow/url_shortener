class ReportsController < ApplicationController
  def index
    # Get all the UrlClicks along with their associated Urls
    @clicks = UrlClick.includes(:url).order(clicked_at: :desc)
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
end
