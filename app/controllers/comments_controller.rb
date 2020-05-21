class CommentsController < ApplicationController
  before_action :logged_in_user
  
  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.save
      redirect_to "/posts/#{@comment.post_id}"
    else
      redirect_to users_path
    end

  end

  def destory
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
