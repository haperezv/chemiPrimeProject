class RequestsController < ApplicationController

    def index
        @requests = Request.all
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)

        if @request.save
            redirect_to requests_index_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def request_params
        params.require(:request).permit(:request_date, :job_time, :job_id)
    end



end
