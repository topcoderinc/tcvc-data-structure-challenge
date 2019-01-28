class HousesController < ApplicationController
  before_action :authenticate_user!

  def index
    @houses = current_user.houses
  end

  def show
    @house = House.find(params[:id])
  end

  def view
  end

  def edit
    @house = House.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @house = House.new
  end

  def create
    @user = User.find(params[:user_id])
    @house = current_user.houses.new(house_params)

    if @house.save
      flash[:notice] = "Post was saved."
      redirect_to action: :index
    else

      flash.now[:alert] = "There was an error saving the post. Address is mandatory."
      render :new
    end
  end

  def update
    @house = House.find(params[:id])
    @house.update_attributes(house_params)

    if @house.save
      flash[:notice] = "Post was updated."
      redirect_to user_house_path(@house.user, @house)
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @house = House.find(params[:id])
    if @house.destroy
      flash[:notice] = "\"#{@house.address}\" was deleted successfully."
      redirect_to action: 'index'
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private
  def house_params
    params.require(:house).permit(:address, :cost, :period, :down_payment,
                                  :interest, :taxes, :payment, :insurance, :total)

  end
end
