class ExtentsController < ApplicationController
  def new
    @extent = Extent.new
  end

  def create
    @extent = Extent.create extent_params

    if @extent.persisted?
      redirect_to  extents_new_path(@extent), notice: "New Extent was successfully created."
    else
      format.html  render :new, status: :unprocessable_entity
    end
  end

  private
  
  def extent_params
    params.require(:extent).permit(:extent)
  end
end
