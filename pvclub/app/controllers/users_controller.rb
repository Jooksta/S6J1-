class UsersController < ApplicationController
  
  def new
  	@user=User.new
  end

  def home
  end

  def login
  end

  def check
  	@user = User.create(user_params)
  	if @user.id == nil then
  		flash[:notice] = "compte invalide - vérifiez tous les champs"
  		redirect_to "/users/login"
  	else
  		login @user
  		flash[:info] = "Merci de vous être inscrit !"
  		redirect_to user_path(@user.id)
  	end
  end

  def show
  		@user=User.find(params[:id])
  		@user_all=User.all
  		puts params
  	end

  	private

  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email)
  	end

  def check_u
	@current_user = User.where(name: params[:prenom], nom: params[:nom], mail: params[:email]).first
	if @current_user
		flash[:info] = "Bienvenue #{@current_user.name} !"
		redirect_to "/users/home"
	else
		flash[:info] = "Echec de la connexion"
		redirect_to "/users/login"
	end
end
end
