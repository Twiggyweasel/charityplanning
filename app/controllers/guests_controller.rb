class GuestsController < ApplicationController
  before_action :set_depends
  
  def new 
    @guest = @attendee.guests.new
    
  end
  
  def create 
    @guest = @attendee.guests.new(guest_params)
    
    respond_to do |format|
      if @guest.save
        format.html { redirect_to event_attendee_url(@event.id, @attendee.id), :flash => { :success => 'Your Guest was successfully added.' }}
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end
  private 
  
    def set_depends
      @event = Event.find(params[:event_id])
      @attendee = Attendee.find(params[:attendee_id])  
    end
    
    def guest_params
      params.required(:guest).permit(:name, :shirt_size, :fee)
    end
    
end