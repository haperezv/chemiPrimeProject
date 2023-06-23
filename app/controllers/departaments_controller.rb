class DepartamentsController < ApplicationController
  before_action :set_departament, only: [:destroy, :show]

  def index
    current_page = params[:page] ||= 1
    @departaments = Departament.all.order("id DESC").paginate(page: current_page, per_page: 5)
  end

  def new
    @departament = Departament.new
  end

  def create
    @departament = Departament.new departament_params

    if @departament.save
      respond_to do |format|
        format.html { redirect_to departaments_path, notice: "Departament was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
      @departament.destroy
      redirect_to departaments_path, notice: "Departament was successfully destroyed."
  end

  private
  
  def departament_params
    params.require(:departament).permit(:departament)
  end

  def set_departament
    @departament = Departament.find(params[:id])
  end
end
