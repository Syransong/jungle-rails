class Admin::SalesController < ApplicationController

  def index
    @sales = Sale.all
    #implicitly will render index 
  end

end
