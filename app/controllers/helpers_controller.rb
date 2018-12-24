class HelpersController < ApplicationController
  
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
    @helper = Helper.new(helper_params)
    if @helper.save
       flash[:success] = '投稿されました'
       redirect_to @helper
    else
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
end







