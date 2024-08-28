class UrlsController < ApplicationController
  protect_from_forgery except: :create
  rescue_from ActionController::Redirecting::UnsafeRedirectError do
    redirect_to root_url, alert: "Redirect to an unsafe URL detected."
  end

  def new
    ## Clear flash messages after user has successfully shortened a URL
    flash.clear
    if params[:id]
      @url = Url.find(params[:id])
      flash[:notice] = "✅ URL successfully shortened!"
    else
      @url = Url.new
    end
    render template: "url/new"
  end

  def create
    @url = Url.new(url_params)
    @url.title = fetch_title(@url.target_url)

    if @url.save
      Rails.logger.info("URL saved with ID: #{@url.id}") 
      redirect_to new_url_path(id: @url.id), notice: "URL successfully created!"
    else
      Rails.logger.error("URL save failed: #{@url.errors.full_messages.join(", ")}")
      respond_to do |format|
        format.html { render "url/new", status: :unprocessable_entity }  # Re-render the form with error messages
        format.json { render json: { errors: @url.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def show
    @url = Url.find(params[:id])
    render json: {
      id: @url.id,
      target_url: @url.target_url,
      short_url: @url.short_url,
      title: @url.title
    }
  end

  def redirect
    if params[:short_url] == "reports"
      @clicks = UrlClick.includes(:url).order(clicked_at: :desc)
      @urls = Url.order(:id)
      render "reports/index"
    else
      url = Url.find_by!(short_url: params[:short_url])

      # Increment the clicks counter
      url.increment!(:clicks)

      geolocation = fetch_geolocation(request.remote_ip)
      UrlClick.create!(
        url: url,
        city: geolocation[:city],
        region: geolocation[:region],
        country: geolocation[:country],
        clicked_at: Time.current,
        ip_address: request.remote_ip,
      )

      redirect_to url.target_url
    end
  end

  private

  def url_params
    params.require(:url).permit(:target_url)
  end

  def fetch_geolocation(ip_address)
    response = HTTP.get("https://ipinfo.io/#{ip_address}/json?token=#{ENV['IPINFO_API_TOKEN']}")
    if response.status.success?
      location_data = JSON.parse(response.body.to_s)
      {
        city: location_data["city"],
        region: location_data["region"],
        country: location_data["country"]
      }
    else
      {
        city: "Unknown",
        region: "Unknown",
        country: "Unknown"
      }
    end
  rescue StandardError => e
    Rails.logger.error "Geolocation fetch failed: #{e.message}"
    { city: "Unknown", region: "Unknown", country: "Unknown" }
  end

  def fetch_title(url)
    response = HTTP.get(url)
    if response.status.success?
      match = response.body.to_s.match(/<title>(.*?)<\/title>/)
      match ? match[1] : nil
    else
      nil
    end
  rescue HTTP::Error
    nil
  end

  def shortened_url(short_url)
    "#{request.base_url}/#{short_url}"
  end
end
