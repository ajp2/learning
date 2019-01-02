class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    render 'new'
  end

  def create
    rental = CatRentalRequest.new(rental_params)
    if rental.save
      redirect_to cats_url
    else
      @cats = Cat.all
      render 'new'
    end
  end

  private
  def rental_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date)
  end
end