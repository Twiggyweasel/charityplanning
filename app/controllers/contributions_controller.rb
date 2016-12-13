class ContributionsController < ApplicationController
  before_action :set_event, only: [:new, :create, :edit, :update]
  
  def show
     
  end
  
  def new
    @contribution = @event.contributions.new
  end
  
  def create
     @contribution = @event.contributions.new(contribution_params)
     
    respond_to do |format|
      if @contribution.save
        format.html { redirect_to @contribution.event, :flash => { :success => 'Contribution of $' + @contribution.amount.to_s + '0 was successfully completed.' }}
        format.js   { }
        format.json { render :show, status: :created, location: @contribution }
      else
        format.html { render :new }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
     
  end
  
  def update
     
  end
  
  private 
  
    def set_event
      @event = Event.find(params[:event_id])    
    end
    
    def contribution_params
      params.required(:contribution).permit(:amount, :in_honor, :honoree, :contributor, :comment, :user_id, :contribution_type)
    end
     
end