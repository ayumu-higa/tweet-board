class ToppagesController < ApplicationController
  def index
    if logged_in?
      @helpers = current_user.helpers.order('created_at DESC').page(params[:page])
    end
  end
end
