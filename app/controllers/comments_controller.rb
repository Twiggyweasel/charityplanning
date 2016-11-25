class CommentsController < ApplicationController
  before_action :set_event
  
  def create
    @comment = @event.comments.create! comments_params
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.js   { }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    
   # redirect_to @event
  end
  
  private 
    def set_event
      @event = Event.find(params[:event_id])    
    end
    
    def comments_params
      params.required(:comment).permit(:body)
    end
end