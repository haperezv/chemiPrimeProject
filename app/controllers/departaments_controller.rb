class DepartamentsController < ApplicationController

  def index
    @departaments = Departament.all
  end

  def new
    @departament = Departament.new
  end

  def create
    @departament = Departament.create departament_params

    if @departament.persisted?
      redirect_to departaments_new_path(@departament), notice: "New Departament was successfully created."
    else
      format.html  render :new, status: :unprocessable_entity
    end
  end

  private
  
  def departament_params
    params.require(:departament).permit(:departament)
  end
end
