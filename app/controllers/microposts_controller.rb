class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @microposts = Micropost.all
    respond_with(@microposts)
  end

  def show
    respond_with(@micropost)
  end

  def new
    @micropost = Micropost.new
    respond_with(@micropost)
  end

  def edit
  end

  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id 
    @micropost.save
    respond_with(@micropost)
  end

  def update
    @micropost.update(micropost_params)
    respond_with(@micropost)
  end

  def destroy
    @micropost.destroy
    redirect_to dashboard_index_path
  end

  private
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
