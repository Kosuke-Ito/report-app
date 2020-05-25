class PostsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]


  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destory
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to "/posts/#{@post.id}"
    else
      render :edit
    end
  end

  def update_post_status
    @post = Post.find(params[:id])
    if params[:status].present?
      @post.status = params[:status].to_i
      @post.save
      redirect_to "/posts/#{@post.id}"
    else
      redirect_to edit_post
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :date_type, :status)
    end

end
