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
    @posted_shift.st_id = params[:sid]
    respond_with(@posted_shift)
  end 

  def edit
  end

  def create
    @user = User.find(current_user.id)
    @shift = @user.shifts.find_by(:shift_id => params[:posted_shift][:st_id], :current_owner => current_user.id)
    @posted_shift = PostedShift.new(posted_shift_params)
    @posted_shift.seller_id = current_user.id
    @posted_shift.st_id = @shift.shift_id
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

  def pick_up

=begin
//If click on pick up this trade shift object 
@seller = User.find(params[:tid])
      @buyer = User.find(current_user.id)
      @shift = @seller.shifts.find(params[:sid])
      @bshift = @buyer.shifts.find_by(:date => @shift.date)
      if @bshift.nil? or !@bshift.overlaps?(@shift)
        @nshift = @buyer.shifts.new
        @nshift = @shift.dup
        @nshift.owner_id = @buyer.id
        @nshift.shift_posted = "Not Posted"
        @nshift.save
        @shift.posted_shift.status = "Traded"
        @shift.posted_shift.save
        @shift.save
        @shift.destroy
      end
=end
  end 
  private
    def set_posted_shift
      @posted_shift = PostedShift.find(params[:id])
    end

    def posted_shift_params
      params.require(:posted_shift).permit(:position, :date, :start_time, :finish_time, :seller_id, :buyer_id, :status)
    end
end
