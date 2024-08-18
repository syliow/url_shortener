class UrlsController < ApplicationController
  protect_from_forgery except: :create
  rescue_from ActionController::Redirecting::UnsafeRedirectError do
    redirect_to root_url, alert: "Redirect to an unsafe URL detected."
  end

  def new
    @url = Url.new
    render template: "url/new"
  end

  def create
    @url = Url.new(url_params)
    @url.title = fetch_title(@url.target_url)
    if @url.save
      render json: {
        target_url: @url.target_url,
        short_url: shortened_url(@url.short_url),
        title: @url.title
      }, status: :created
    else
      render json: { errors: @url.errors.full_messages }, status: :unprocessable_entity
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
    @url = Url.find_by!(short_url: params[:short_url])
    @url.increment!(:clicks)
    if safe_redirect?(@url.target_url)
      redirect_to @url.target_url
    else
      render plain: "Unsafe redirect detected.", status: :forbidden
    end
  end

  private

  def url_params
    params.require(:url).permit(:target_url)
  end

  def safe_redirect?(url)
    uri = URI.parse(url)
    return false unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
    true
  rescue URI::InvalidURIError
    false
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
