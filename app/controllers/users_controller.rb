class UsersController < ApplicationController
  # render new.rhtml
  def new
  end
  
  
  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or use the contact link at the bottom."
      render :action => 'new'
    end
  end
  
def edit
  @user = User.find(current_user.id)
end
def update
  @user = User.find(current_user.id)
  if @user.update_attributes(params[:user])
    redirect_to profile_path
  else
    @user = User.find(current_user.id)
    flash[:error] = "Your email address could not be updated try again"
    redirect_to edit_profile_path(current_user.profile)
  end
end


end
