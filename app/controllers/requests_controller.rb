class RequestsController < ApplicationController

    def index
        current_page = params[:page] ||= 1
        @requests = Request.where("request_date <= ?", Date.today).order("request_serial DESC").paginate(page: current_page, per_page: 5)
    end

    def new
       @request = Request.new
       @request.slurries << Slurrie.new if @request.slurries.empty?
    end

    def get_data

        x9 = params[:x9]
        t8_roundup = params[:t8_roundup]
        t8_rounddown = params[:t8_rounddown]
        valorGradiente = params[:valorGradiente]
        x11 = params[:x11]
        x10 = params[:x10]

        busqueda1 = Casing.where(depth: x9.to_f, valor: t8_roundup.to_f)
        busqueda2 = Casing.where(depth: x9.to_f, valor: t8_rounddown.to_f)
        busqueda3 = valorGradiente.to_f -  t8_rounddown.to_f

        if busqueda1.empty?
            @b1 = 0
        else
            busqueda1.each do |b1|
                @b1 = b1.casing
            end
        end

        if busqueda2.empty?
            @b2 = 0
        else
            busqueda2.each do |b2|
                @b2 = b2.casing
            end
        end

        puts "@b1 #{@b1}"
        puts "@b2 #{@b2}"
        puts "busqueda3 #{busqueda3}"

        t9 = (@b1 - @b2) * busqueda3  * 10 + @b2

        puts "t9: #{t9}"

        busqueda4 = Casing.where(depth: x11.to_f, valor: t8_roundup.to_f)
        busqueda5 = Casing.where(depth: x11.to_f, valor: t8_rounddown.to_f)


        if busqueda4.empty?
            @b4 = 0
        else
            busqueda4.each do |b4|
                @b4 = b4.casing
            end
        end

        if busqueda5.empty?
            @b5 = 0
        else
            busqueda5.each do |b5|
                @b5 = b5.casing
            end
        end

        t11 = (@b4 - @b5) * busqueda3  * 10 + @b5

        puts "t11: #{t11}"
        #debugger
        busqueda9 = Liner.where(datoa: x10.to_f)

        
        if busqueda9.empty?
            @b9 = 0
        else
            busqueda9.each do |b9|
                 @b9 = b9.datob
                 puts "busqueda9 #{b9}"
            end
        end

        data = {
            t9: t9,
            t11: t11,
            b9: @b9
        }

        puts data
        
        respond_to do |format|
          format.json { render json: data }
        end
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
       @request = Request.includes(:job).friendly.find(params[:id])
    end

    def search
        @q = params[:q]
        @requests = Request.where("request_serial LIKE ?", "%#{@q}%")
    end

    def bhst_calculator
        
    end

    private

    def request_params
        params.require(:request).permit( :job_time, :job_id, :location, :customer_id, :extent_id, :departament_id, :well_name, :pipe_size, :bhst, :temperature_gradient, :depth_md, :depth_tvd, :psi, :bhct, :time_mezcla, :mud_weight, :time_security, :time_pumpability,
        :time_operation, :total_time, :aporte_id, :nivel_id, :aditivo_id, :slurrie_id, slurries_attributes: [ :id,:density, :concentration, :lote, :extent_id, :aditivo_id] )
    end
    

end
