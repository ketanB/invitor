class CommentsController < ApplicationController
  respond_to :js, :only => [:create, :by_event, :destroy, :update_comment]

  def new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id if current_user
    @comment.save
    #@comments = Comment.where(:event_id => @comment.event_id, :parent_id => nil)
  end

  def edit
  end

  def update_comment
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy    
  end

  def by_event
    @comments = Comment.where(:event_id => params[:event_id], :parent_id => nil)
  end
  
end
