class SessionsController < ApplicationController

    def create
       user = User.find_by(email: session_params[:email])
       if user && user.authenticate(session_params[:password])
         # Log the user in and redirect to the user's show page.
         session[:user_id]=user.id
         session[:user_name]=user.name
               redirect_to bugzilas_path
       else
         flash[:login_error] = 'Invalid email/password combination' # Not quite right!
         redirect_to login_path
       end

     end

     def destroy
    #  User.find(session_params[:id]).destroy

  #log_out
  # session.delete :id
       session[:user_id]= nil
  redirect_to root_path
     end


  private
     def session_params
       params.require(:session).permit(:email,:password)
     end
end
