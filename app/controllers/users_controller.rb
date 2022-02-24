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
          format.html { redirect_to users_path, notice: "Utilisateur." }
          format.js { }
        else
          format.html { redirect_to users_path, notice: "User was unsuccessfully created." }
          format.js { }
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to users_path, notice: "User was successfully updated." }
          format.js { }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.js { }
        end
      end
    end

    def destroy
      @user.destroy
  
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.js { }
      end
    end

    def random_select
      
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
  end
  
