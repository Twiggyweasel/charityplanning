class CouponsController < ApplicationController
  before_action :set_event
  def index
  
  end
  
  def create
     @coupon = @event.coupons.new(coupon_params)
     
    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon.event, :flash => { :success => 'Coupon ' + @coupon.promo_code + ' was successfully completed.' }}
        format.js   { }
        format.json { render :show, status: :created, location: @contribution }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  private
  
    def set_event
      @event = Event.find(params[:event_id])
    end
    
    def coupon_params
      params.required(:coupon).permit(:promo_code, :discount, :description, :start_date, :expiration)
    end
end