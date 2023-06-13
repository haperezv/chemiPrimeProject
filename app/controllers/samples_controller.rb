class SamplesController < ApplicationController
  before_action :set_sample, only: [:destroy, :show]

  def index
    @samples = Sample.all
  end

  def new
    @sample = Sample.new
  end

  def show
  end

  def create
    @sample = Sample.create sample_params

    if @sample.persisted?
        redirect_to samples_new_path, notice: "New Sample was successfully created." 
    else
        render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @sample.destroy
    redirect_to samples_path, notice: "Sample was successfully destroyed."
  end


  private
  
  def sample_params
    params.require(:sample).permit(:sample)
  end

  def set_sample
    @sample = Sample.find(params[:id])
  end
end
