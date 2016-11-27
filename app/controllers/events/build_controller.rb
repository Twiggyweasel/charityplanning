class Events::BuildController < ApplicationController
  include Wicked::Wizard
  
  steps :name, :description
  
  def show
    
    @event = Event.find(params[:event_id])
    render_wizard
  end
  
  def update 
    
    @event = Event.find(params[:event_id])
    @event.update_attributes(params[:event])
    render_wizard
  end
  
  def create 
    @event = Event.create
    redirect_to wizard_path(steps.first, :event_id => @event.id)
  end
end