class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
    end

    def create
        @findUser = User.find_by(usuario: params[:usuario])
        if @findUser
            render json:{ message: 'El usuario ya existe' }, status: :unprocessable_entity
        else
            @user = User.new(user_params)
            if @user.save
                # render :show, status: :created, location: @user
                render json: { message: 'Usuario creado' }
            else
                render json: @user.errors, status: :unprocessable_entity
            end
        end
    end

    def destroy
        @user.destroy
    end

    private
        def set_user
            @user = User.find(params[:id])
        end
        def user_params
            params.require(:user).permit(:usuario, :password)
        end
end
