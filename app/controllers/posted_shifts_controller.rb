class PostedShiftsController < ApplicationController
  before_action :set_posted_shift, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posted_shifts = PostedShift.all
    respond_with(@posted_shifts)
  end

  def show
    respond_with(@posted_shift)
  end

  def new 
    @shift = Shift.find_by(:shift_id => params[:sid]) 
    @posted_shift = PostedShift.new
    respond_with(@posted_shift)
  end 

  def edit
  end

  def create
    @shift = Shift.find(params[:posted_shift][:shift_id])
    @posted_shift = PostedShift.new(posted_shift_params)
    @posted_shift.save
    respond_with(@posted_shift)
  end

  def update
    @posted_shift.update(posted_shift_params)
    respond_with(@posted_shift)
  end

  def destroy
    @posted_shift.destroy
    respond_with(@posted_shift)
  end

  private
    def set_posted_shift
      @posted_shift = PostedShift.find(params[:id])
    end

    def posted_shift_params
      params.require(:posted_shift).permit(:position, :date, :start_time, :finish_time, :seller_id, :buyer_id, :status)
    end
end
