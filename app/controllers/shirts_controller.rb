class ShirtsController < ApplicationController
#   before_filter :login_required
   before_filter :login_required, :only => [:new, :edit]
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @shirts = @user.shirts
    else
      @shirts = Shirt.find(:all)
    end
    @genders = Gender.find(:all)
    @sizes = Size.find(:all)
    # select all sizes by default if none is selected
    @selected_sizes = @sizes.map{|size| size.name} if @selected_sizes.blank?
    respond_to do |format|
      format.html
      format.xml { render :xml => @shirts}
      @shirts = Shirt.paginate :per_page => 6, :page => params[:page], :order => 'updated_at ASC' 
    end
  end
  
  def new
    @shirt = Shirt.new
    @sizes = find_all_sizes
    @genders = find_all_genders
  end
  
  def create
    @shirt = Shirt.new(params[:shirt])
    @shirt.user = current_user;
    if @shirt.save
      flash[:notice] = 'Shirt was successfully added.'
      redirect_to shirts_path
    else
      flash[:error] = 'Shirt was not added, try again!'
      redirect_to new_shirt_path
    end
  end
  
  def show
    @shirt = Shirt.find(params[:id])
    if logged_in?
    @message = current_user.sent_messages.build
  end
  end
  
  def edit
    @sizes = find_all_sizes
    @genders = find_all_genders
    if @shirt = current_user.shirts.find(params[:id])
      flash[:notice] = 'Feel free to edit you shirt!'
    end
  end
  
  
  def update
    @shirt = Shirt.find(params[:id])
    if @shirt.update_attributes(params[:shirt])
      flash[:notice] = 'Shirt information was scuccessfully updated.'
      redirect_to shirts_path
    else
      redirect_to new_shirt_path
    end
  end
  
  def filter_by_gender
    @selected_genders = params[:genders]
    @shirts = Shirt.find_by_genders(@selected_genders)
    @genders = Gender.find(:all)
    render :action => "index"
  end
  
  def filter_by_size
    @selected_sizes = params[:sizes]
    @shirts = Shirt.find_by_sizes(@selected_sizes).paginate :per_page => 6, :page => params[:page]    
    @sizes = Size.find(:all)
    render :action => "index"    
  end
  
  def destroy
    @shirt = Shirt.find(params[:id])
    @shirt.destroy
  end
  


  private

  def find_all_sizes
    Size.find(:all)
  end

  def find_all_genders
    Gender.find(:all)
  end
end

