class UrlsController < ApplicationController
  def new
    @url = Url.new
    render template: 'url/new'
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      respond_to do |format|
        format.html { redirect_to @url, notice: "Short URL created successfully!" }
        format.json { render json: @url, status: :created }
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:alert] = "There was a problem creating the short URL."
          render :new
        end
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  def redirect
    @url = Url.find_by!(short_url: params[:short_url])
    @url.increment!(:clicks)
    redirect_to @url.target_url, allow_other_host: true
  end

  private

  def url_params
    params.require(:url).permit(:target_url)
  end
end
