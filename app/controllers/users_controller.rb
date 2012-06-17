class UsersController < ApplicationController
  def new
    @user = User.new
  	@titre = "Inscription"
  end

  def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end

  def create
    @user= User.new(params[:user])
    if @user.save
        flash[:success] = "Bienvenue dans l'Application Exemple!"
        redirect_to @user
    else
        @titre = "Inscription"
        render 'new'
    end
  end
end
