class RequestsController < ApplicationController

    def index
        current_page = params[:page] ||= 1
        @requests = Request.where("request_date <= ?", Date.today).order("request_serial DESC").paginate(page: current_page, per_page: 5)
    end

    def new
        @request = Request.new
    end

    def create
        
        @request = Request.new(request_params)
        @request.request_date = Date.today

        if @request.save
            redirect_to requests_path, notice: "New Request was successfully created."
        else
            render :new, status: :unprocessable_entity
        end

    end

    def show
       # @request = Request.find(params[:id])
       @request = Request.friendly.find(params[:id])
    end

    def search
        @q = params[:q]
        @requests = Request.where("request_serial LIKE ?", "%#{@q}%")
    end

    def bhst_calculator
        
    end

    private

    def request_params
        params.require(:request).permit( :job_time, :job_id, :location, :customer_id, :extent_id, :departament_id, :well_name, :pipe_size, :bhst, :temperature_gradient, :depth_md, :depth_tvd, :psi, :bhct, :time_mezcla, :mud_weight)
    end
    

end
