class Admin::SalesController < ApplicationController
  # Basic HTTP Authentication
  http_basic_authenticate_with name: ENV["ADMIN_HTTP_BASIC_USER"], password: ENV["ADMIN_HTTP_BASIC_PASSWORD"]

  # Bcrypt User Authentication 
  before_filter :authorize
  
  def index
    @sales = Sale.all
    #implicitly will render index 
  end

end
