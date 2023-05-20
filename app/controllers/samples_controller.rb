class SamplesController < ApplicationController
  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.create sample_params

    if @sample.persisted?
        redirect_to samples_new_path(@sample), notice: "New Sample was successfully created." 
    else
        render :new, status: :unprocessable_entity
    end
  end

  private
  
  def sample_params
    params.require(:sample).permit(:sample)
  end
end
