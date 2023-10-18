class SlurrieDensitiesController < ApplicationController

    def index
       @slurrie_densities = SlurrieDensity.all
    end

    def create
        @slurrie_densities = SlurrieDensity.new(slurrie_densities_params)
    
        respond_to do |format|
          if @slurrie_densities.save
            format.html { redirect_to slurrie(@slurrie_densities), notice: "Slurrie was successfully created." }
            format.json { render :show, status: :created, location: @slurrie_densities }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @slurrie_densities.errors, status: :unprocessable_entity }
          end
        end
    end

    private

    def slurrie_densities_params
        params.require(:slurrie_density).permit(:slurrie_densitie, :request_id, :extent_id)
    end

end
