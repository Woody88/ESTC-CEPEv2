class DashboardController < ApplicationController
	before_filter :authenticate_user!
   respond_to :html
  def index
  	@microposts = Micropost.all
    respond_with(@microposts)
  end
end
