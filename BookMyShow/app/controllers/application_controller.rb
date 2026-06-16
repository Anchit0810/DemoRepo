class ApplicationController < ActionController::API
    include JsonWebToken
    def authenticate_user
        header = request.headers['Authorization']
        token = header.split(' ').last if header   
        decoded = JsonWebToken.decode_token(token)         
        if decoded
            @current_user = User.find(decoded["user"] || decoded["user_id"])
        else
            render json: {message: "Unauthorized user"}, status: :unauthorized
        end
    end
end
