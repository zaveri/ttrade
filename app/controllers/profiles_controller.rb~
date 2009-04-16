class ProfilesController < ApplicationController
  def index
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(params[:profile])
    redirect_to new_profile_path
  end
  
  def show
    @profile = Profile.find(params[:id])
  end
  def edit
    @profile = Profile.find(current_user.profile.id)
  end
  
  def update
    @profile = Profile.find(current_user.profile.id)
    if @profile.update_attributes(params[:profile])
      redirect_to :action => 'show', :id => @profile
    else
      @user = User.find (:all)
      render :action => 'edit'
    end
  end
  
end
