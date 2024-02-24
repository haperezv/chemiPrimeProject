class SlurriesController < ApplicationController
    before_action :set_slurrie, only: %i[ show edit destroy ]

    def index
        @slurries = Slurrie.all
    end

    def show
    end

    def new
      @slurrie = Slurrie.new
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("informations", partial: "slurries/nested_form", locals: { slurrie: @slurrie })
        end
      end
    end

    def edit
    end

    def create
        @slurrie = Slurrie.new(slurrie_params)
    
        respond_to do |format|
          if @slurrie.save
            format.html { redirect_to slurrie(@slurrie), notice: "Slurrie was successfully created." }
            format.json { render :show, status: :created, location: @slurrie }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @slurrie.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def destroy
        @slurrie.destroy
    
        respond_to do |format|
          format.html { redirect_to slurrie_url, notice: "Phone number was successfully destroyed." }
          format.json { head :no_content }
        end
    end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_slurrie
            @slurrie = Slurrie.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def slurrie_params
            params.require(:slurrie).permit(:request_id, :aditivo_id, :extent_id, :concentration, :lote)
        end



end