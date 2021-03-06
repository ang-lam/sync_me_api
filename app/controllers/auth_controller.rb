class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login]

    def login
        user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token}, status: :accepted
            # render json: UserSerializer.new(user)
            # render json: user.to_json(:include => [:mentors, :mentees])
        else
            render json: {failure: "Invalid email or password"}, status: :unauthorized
        end
    end

    def auto_login
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    private

    def login_params
        params.require(:user).permit(:email, :password)
    end

end