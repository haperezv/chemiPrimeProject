class SamplesController < ApplicationController
  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.create sample_params

    if @sample.persisted?
      respond_to do |format|
        format.html { redirect_to samples_new_path(@sample), notice: "New Sample was successfully created." }
        end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def sample_params
    params.require(:sample).permit(:sample)
  end
end
