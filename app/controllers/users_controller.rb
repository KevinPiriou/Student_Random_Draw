class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    
    def index
      @users = User.all
    end

    def show
    end

    def edit
    end
  
    def create
      @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save
          format.html { redirect_to users_path, notice: "Utilisateur inscrit" }
          format.json { }
        else
          format.html { redirect_to users_path, alert: "Veuillez remplir le formulaire" }
          format.json { }
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_update_params)
          format.html { redirect_to users_path, notice: "Utilisateur mis a jour" }
          format.js { }
        else
          format.html { redirect_to users_path, alert: "Echec lors de la mise à jour" }
          format.js { }
        end
      end
    end

    def destroy
      @user.destroy
  
      respond_to do |format|
        format.html { redirect_to users_url, notice: "Utilisateur supprimé avec succès" }
        format.js { }
      end
    end

    def random_select
      random_user = User.all.sample
      @user_select = random_user.first_name
      respond_to do |format|
        format.html { redirect_to users_url, notice: "#{@user_select} à été choisi" }
        format.js { }
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:first_name, :last_name)
    end

    def user_update_params
      params.require(:user).permit(:first_name, :last_name)
    end
  end
  
