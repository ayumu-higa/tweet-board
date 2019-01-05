class HelpersController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:[:index,:show,:edit,:update,:destroy]
  def index
    @helpers = Helper.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def show
    set_helper
  end
  
  def new
    @helper = Helper.new
  end
  
  def create
    @helper = current_user.helpers.build(helper_params)
    
    if @helper.save
       flash[:success] = '投稿されました'
       redirect_to @helper
    else
      @helper = current_user.helpers.order('created_at DESC').page(params[:page])
      
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end
  
  def edit
    set_helper
  end
  
  def update
    set_helper
    if @helper.update(helper_params)
       flash[:success] = '更新されました'
       redirect_to @helper
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
    
  end
  
  def destroy
    set_helper
    @helper.destroy
    flash[:success] = '削除されました'
    redirect_to helpers_url
    
    
  end
  
  private
  
  def set_helper
    @helper = Helper.find(params[:id])
  end
  
  #strong parameter
  
  def helper_params
    params.require(:helper).permit(:content,:status)
  end
  
  def correct_user
    @helper = current_user.helpers.find_by(id: params[:id])
    unless @helper
     redirect_to root_url
    end
    
  end
  
  
  
end







