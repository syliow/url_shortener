class ReportsController < ApplicationController
  def index
    @clicks = Click.all
    render :index
  end
end
