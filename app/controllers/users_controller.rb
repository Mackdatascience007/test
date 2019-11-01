class UsersController < ApplicationController
    
    def welcome
        @user = params['id']
    end
    
    def index
        @user = User.all
    end

    def show
    end

    def new

    end

    def create
        user = User.new(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation]
        )
        if user.save
            session[:user_id] = user.id
            flash[:danger] = "Successfully Created User!"
            redirect_to gossips_path
        else 
            flash[:danger] = "Invalid email or password, Try again!"
            redirect_to contact_path
        end
    end

    def edit
    end

# UODATE /users/1
    def update
        @user = User.find(params['id'])
        @user.update(user_params)
    end

# DELETE /users/1
    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end


    private
    def user_params
        params.require(:user).permit(:first_name, :email, :password_digest)
    end
end