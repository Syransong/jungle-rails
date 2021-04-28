class Admin::DashboardController < ApplicationController
  # Basic HTTP Authentication
  http_basic_authenticate_with name: ENV["ADMIN_HTTP_BASIC_USER"], password: ENV["ADMIN_HTTP_BASIC_PASSWORD"]

  def show
  end
end
