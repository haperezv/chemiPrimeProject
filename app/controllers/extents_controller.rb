class ExtentsController < ApplicationController
  before_action :set_extent, only: [:show, :destroy]

  def index
    @extents = Extent.all
  end

  def show
  end

  def new
    @extent = Extent.new
  end

  def create
    @extent = Extent.create extent_params

    if @extent.persisted?
      redirect_to  extents_path, notice: "New Extent was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @extent.destroy
    redirect_to extents_path, notice: "Extent was successfully destroyed."
  end

  private
  
  def extent_params
    params.require(:extent).permit(:extent)
  end

  def set_extent
    @extent = Extent.find(params[:id])
  end
end
