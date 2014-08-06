class SessionsController < ApplicationController
    
    def new
        cookies[:return_to] = {
            value: request.referrer, 
            expires: 1.hour.from_now
        }
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            sign_in user
            #redirect_to user
            path = cookies[:return_to]
            cookies.delete(:return_to)
            flash[:success] = "Signed in successfully"
            redirect_to path
            
        else
            flash[:error] = 'Invalid email/password combination'
            render 'new'
        end
    end

    def destroy
        sign_out
        redirect_to root_url
    end

end
