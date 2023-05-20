class JobsController < ApplicationController

    def index
        @jobs = Job.all
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.create job_params

        if @job.persisted?
            redirect_to jobs_new_path(@job), notice: "New Job was successfully created."
        else
             render :new, status: :unprocessable_entity
        end
    end

    private

    def job_params
        params.require(:job).permit(:job_type)
    end
end
