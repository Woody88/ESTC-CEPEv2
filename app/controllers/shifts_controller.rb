class ShiftsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shifts = Shift.all.where(:current_owner => current_user.id)
    respond_to do |format| 
      format.html
      format.js { render :json => @shifts } 
    end
  end

  def show
    #@shift = Shift.find(params[:id])
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
    respond_with(@shift, :location => shift_path(@shift.shift_id))
  end

  def update
    @shift = Shift.find_by(params[:shift][:shift_id], :current_owner => current_user.id)
    @shift.update(shift_params)
    respond_with(@shift, :location => shift_path(@shift.shift_id))
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    respond_with(@shift)
  end

  private
    def set_shift
      @shift = Shift.find_by(:shift_id => params[:id], :current_owner => current_user.id)
    end

    def shift_params
      params.require(:shift).permit(:position, :date, :start_time, :finish_time, :original_owner, :current_owner, :shift_id, :shift_posted)
    end
end
