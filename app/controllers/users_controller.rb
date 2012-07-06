class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:destroy]

  def new
    @user = User.new
  	@titre = "Inscription"
  end

  def index
    @titre = "Tous les utilisateurs"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @titre = @user.nom
  end

  def create
    @user= User.new(params[:user])
    if @user.save
        sign_in @user
        flash[:success] = "Bienvenue dans l'Application Exemple!"
        redirect_to @user
    else
        @titre = "Inscription"
        render 'new'
    end
  end

  def edit
    @titre = "Edition profil"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil actualise"
      redirect_to @user
    else
      @titre = "Edition profil"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilistaeur supprime."
    redirect_to users_path
  end

  def following
    @titre = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @titre = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
