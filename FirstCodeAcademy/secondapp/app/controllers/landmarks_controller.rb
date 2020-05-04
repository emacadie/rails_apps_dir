class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.all
  end

  def new
    @landmark = Landmark.new
  end

  def create
    landmark = Landmark.new
    landmark.name = params[:landmark][:name]
    landmark.cost = params[:landmark][:cost]
    landmark.save
    redirect_to :root
  end

  def show
    @landmark = Landmark.find_by_id(params[:id])
  end
end
