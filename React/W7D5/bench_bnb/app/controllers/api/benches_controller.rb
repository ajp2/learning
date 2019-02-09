class Api::BenchesController < ApplicationController
  def create
    @bench = Bench.new(bench_params)
    if @bench.save
      render :show
    else
      render json: @bench.errors.full_messages, status: 422
    end
  end

  def index
    @benches = Bench.in_bounds(params[:bounds], params[:minSeating], params[:maxSeating])
    render :index
  end

  def show
    @bench = Bench.find(params[:id])
    render :show
  end

  private
  def bench_params
    params.require(:bench).permit(:description, :lat, :lng, :seating)
  end
end