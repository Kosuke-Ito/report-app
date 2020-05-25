class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]

  def index
    if params[:date_type] == "1"
      @posts = current_user.posts.where(date_type: 1)
    else
      @posts = current_user.posts
    end
    @subordinate = User.where(id: current_user.subordinate_id) if current_user.subordinate_id.present?
  end

  def show
    @user = User.find(params[:id])
    if params[:date_type] == "1"
      @posts = @user.posts.where(date_type: 1)
    else
      @posts = @user.posts
    end
    @boss = User.find_by(id: @user.boss_id) if @user.boss_id.present?
    @subordinate = User.where(id: @user.subordinate_id) if @user.subordinate_id.present?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '新しいユーザーを登録しました。'
      redirect_to '/login'
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def update
    user = User.find(params[:user_id])
    if params[:boss_id].present?
      boss = User.find(params[:boss_id])
      user.boss_id = boss.id
      boss.subordinate_id = user.id
      boss.save
    end
    if params[:admin_flag].present?
      user.admin_flag = ActiveRecord::Type::Boolean.new.cast(params[:admin_flag])
    end
    user.save
    redirect_to "/users/#{user.id}"
  end

  def search
    if params[:name].present?
      # @user = User.find(params[:user_id])
      @searched_user = User.where("name like ?", "%#{params[:name]}%")
    end
  end

  def boss_search
    if params[:name].present?
      @user = User.find(params[:user_id])
      unless @user.name.include?(params[:name])
        @boss_user = User.where("name like ?", "%#{params[:name]}%")
      end
    end
  end

  private
    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
