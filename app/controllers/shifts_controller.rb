class ShiftsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shifts = Shift.all
    respond_to do |format| 
      format.html
      format.js { render :json => @shifts } 
    end
  end

  def show
    respond_with(@shift)
  end

  def new
    @shift = Shift.new
    respond_with(@shift)
  end

  def edit
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.original_owner = @shift.current_owner = current_user.id
    @shift.shift_posted = "Not Posted"
    @shift.save
    respond_with(@shift.id)
  end

  def update
    @shift = Shift.find(params[:id])
    @shift.update(shift_params)
    respond_with(@shift)
  end

  def destroy
    @shift.destroy
    respond_with(@shift)
  end

  private
    def set_shift
      @shift = Shift.find(params[:id])
    end

    def shift_params
      params.require(:shift).permit(:position, :date, :start_time, :finish_time, :original_owner, :current_owner, :shift_id, :shift_posted)
    end
end
