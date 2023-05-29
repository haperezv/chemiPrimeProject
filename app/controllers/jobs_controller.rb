class JobsController < ApplicationController
    before_action :set_job, only: [:destroy, :show]

    def index
        current_page = params[:page] ||= 1
        @jobs = Job.all.order("id DESC").paginate(page: current_page, per_page: 5)
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.create job_params

        if @job.persisted?
            redirect_to jobs_path, notice: "New Job was successfully created."
        else
             render :new, status: :unprocessable_entity
        end
    end

    def show
    end

    def destroy
        @job.destroy
        redirect_to jobs_path, notice: "Job was successfully destroyed."
    end

    private

    def job_params
        params.require(:job).permit(:job_type)
    end

    def set_job
        @job = Job.find(params[:id])
    end
end
