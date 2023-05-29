class DepartamentsController < ApplicationController
  before_action :set_departament, only: [:destroy, :show]

  def index
    @departaments = Departament.all
  end

  def new
    @departament = Departament.new
  end

  def create
    @departament = Departament.create departament_params

    if @departament.persisted?
      redirect_to departaments_path, notice: "New Departament was successfully created."
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
