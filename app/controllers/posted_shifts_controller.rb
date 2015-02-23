class PostedShiftsController < ApplicationController
  before_action :set_posted_shift, only: [:show, :edit, :update, :destroy]
  before_action :set_pick_up, only: [:pick_up]
  respond_to :html

  def index
    @posted_shifts = PostedShift.all.where(:status => "Not Traded")
    respond_with(@posted_shifts)
  end

  def show
    respond_with(@posted_shift, :location => posted_shifts_url)
  end

  def new 
    @shift = Shift.find_by(params[:id]) 
    @posted_shift = PostedShift.new
    @posted_shift.st_id = params[:sid]
    respond_with(@posted_shift, :location => @posted_shifts_path)
  end 

  def edit
  end

  def create
    @user = Profile.find(current_user.id)
    @shift = @user.shifts.find_by(params[:id])
    @posted_shift = PostedShift.new(posted_shift_params)
    @posted_shift.seller_id = current_user.id
    @posted_shift.st_id = @shift.id
    @shift.shift_posted = "Posted"
    if @posted_shift.save && @shift.save
      flash[:notice] = "Shift Posted For Trade"
    end
    respond_with(@posted_shift, :location => @posted_shifts_path)
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
=begin If click on pick up this trade shift object 
      @buyer = Profile.find_by(:user_id => current_user.id)
      @shift = Shift.find(params[:sid])
      @bshift = @buyer.shifts.find_by(:date => @shift.date)
      if @bshift.nil? or !@bshift.overlaps?(@shift) 
        @trade = Shift.confirm_trade(@shift)
        @trade.current_owner = current_user.id
        @trade.shift_posted = "Not Posted"
        if @trade.save
          @shift.destroy
           @posted_shifts.status = "Traded"
        end 
        respond_with(@trade, :location => shifts_url)
      end
=end
      @buyer = Profile.find_by(:user_id => current_user.id)
      @shift = Shift.find(params[:sid])
      @bshift = @buyer.shifts.find_by(:date => @shift.date)
      if @bshift.nil? or !@bshift.overlaps?(@shift) 
        @shift.current_owner = @buyer.user_id
        @shift.shift_posted =  "Not Posted"
        @shift.posted_shift.status = "Traded"
        if @shift.save && @shift.posted_shift.save
          flash[:notice] = "Shift Traded"
        end
      end
  end 

  private
    def set_posted_shift
      @posted_shift = PostedShift.find(params[:id])
    end
    
    def set_pick_up
      @posted_shift = PostedShift.find_by(:id => params[:sid])
    end
    
    def posted_shift_params
      params.require(:posted_shift).permit(:position, :date, :start_time, :finish_time, :seller_id, :buyer_id, :status)
    end
end
