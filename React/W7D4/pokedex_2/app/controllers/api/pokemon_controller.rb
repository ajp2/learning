class Api::PokemonController < ApplicationController
  def create
    @pokemon = Pokemon.new(pokemon_params);
    if @pokemon.save
      render :show
    else
      render json: @pokemon.errors.full_messages, status: 422
    end
  end

  def index
    @pokemon = Pokemon.all
    render :index
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    render :show
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :poke_type, :attack, :defense, :image_url, moves: [])
  end
end
