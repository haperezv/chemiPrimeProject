class ParameterDesignsController < ApplicationController
    def index
        @parameter_desings = ParameterDesing.all
    end

    def new
        @parameter_desing = ParameterDesing.new
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append("parameters", partial:"parameter_desings/nested_form")
          end
        end
    end
end