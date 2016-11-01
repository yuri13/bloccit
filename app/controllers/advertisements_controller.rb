class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]

    if @advertisment.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisment
    else
      flash.now[:alert] = "There was an error saving the advertisment. Please try again."
      render :new
    end

  end
end
