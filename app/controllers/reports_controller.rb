class ReportsController < ApplicationController
  def index
    @clicks = Click.includes(:url).order(created_at: :desc)
  end
end