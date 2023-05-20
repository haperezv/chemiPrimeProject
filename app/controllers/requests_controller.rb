class RequestsController < ApplicationController

    def index
        @requests = Request.all
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
   #    @request.request_date = Date.today

        if @request.save
            redirect_to requests_index_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @request = Request.find(params[:id])
    end

    private

    def request_params
        params.require(:request).permit( :request_date, :job_time, :job_id, :location, :customer_id, :sample_id, :extent_id, :departament_id, :well_name)
    end



end
