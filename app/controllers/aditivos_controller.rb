class AditivosController < ApplicationController
    before_action :set_aditivo, only: [:destroy, :show]
    def index
        current_page = params[:page] ||= 1
        @aditivos = Aditivo.all.order("id DESC").paginate(page: current_page, per_page: 5)
    end

    def new
        @aditivo = Aditivo.new
    end

    def create
        @aditivo = Aditivo.create aditivo_params
    
        if @aditivo.save
          respond_to do |format|
            format.html { redirect_to aditivos_path, notice: "New Adittive was successfully created." }
            format.turbo_stream
          end
        else
          render :new, status: :unprocessable_entity
        end
    end

    def show
    end
  
    def destroy
      @aditivo.destroy
      redirect_to aditivos_path, notice: "Additive was successfully destroyed."
    end
  
    private
  
    def aditivo_params
      params.require(:aditivo).permit(:aditivo)
    end
  
    def set_aditivo
      @aditivo = Aditivo.find(params[:id])
    end

end