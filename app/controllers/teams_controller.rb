class TeamsController < ApplicationController
  before_action :set_event, :set_attendee
  
  def new
    @team = @event.teams.new
  end
  
  
  
  private 
    def set_event
      @event = Event.find(params[:event_id])
    end
    
    def set_attendee
      @attendee = Attendee.find(params[:attendee_id])
    end
end