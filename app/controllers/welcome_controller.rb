class WelcomeController < ApplicationController
  def index
    if params[:search] && params[:search] != ""
      if MerchantFacade.search_merchants(params[:search]) == []
        flash[:alert] = "No Merchants match search"
      else
        @merchants = MerchantFacade.search_merchants(params[:search])
      end
    elsif params[:search] == ""
      flash[:alert] = "Nothing to search, please try again"
      render "index"
    end
  end
end