class SessionsController < ApplicationController
    def welcome
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new

    end

    def create
      @user =  User.find_by(username: params[:user][:username])
    #   if @user && @user.authenticate(params[:user][:password])

        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] =@user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "login info incorrect. Please try again."
            redirect_to login_path
    end
end

        def github
        #   binding.pry
            @user = User.from_omniauth(request.env["omniauth.auth"])
            session[:user_id] = @user.id
            redirect_to shoes_path
    end
    
end


    private

       def auth
        request.env['omniauth.auth']
       end

    #     def omniauth
    #         binding.pry
    #         omniauth = request.env['omniauth.auth'] ['info']
    #         user = User.find_or_create_by(email: omniauth["email"]) do |u|
    #         u.username = omniauth["name"]
    #         u.password = SecureRandom.hex
    #     end
    #     session[:user_id] = @user.id
    #     redirect_to shoes_path
    # end

