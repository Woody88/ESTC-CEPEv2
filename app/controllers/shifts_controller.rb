class ShiftsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :xml

  def index
    @shifts = Shift.all.where(:current_owner => current_user.id)
    respond_with(@shifts)
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
    if @shift.save
      flash[:notice] = "Shift Successfully Created."
    end
    respond_with(@shift)
  end

  def update
    @shift = Shift.find_by(params[:id])
    if @shift.update(shift_params)
      flash[:notice] = "Shift Successfully Updated."
    end
    respond_with(@shift)
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    respond_with(@shift)
  end

  private
    def set_shift
      @shift = Shift.find_by(params[:id])
    end

    def shift_params
      params.require(:shift).permit(:position, :date, :start_time, :finish_time, :original_owner, :current_owner, :shift_id, :shift_posted)
    end
end
