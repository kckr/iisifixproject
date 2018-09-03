module VehicleOwners
  class JobsController < VehicleOwnersController
    before_action :set_job, except: :index

    layout 'master', only: [:index, :show]

    def index
      @active_jobs      = current_user.jobs.active
      @archived_jobs    = current_user.jobs.archived
      @jobs_doing_count = current_user.jobs.doing.count
    end

    def show
    end

    def cancel
      @job.transaction do
        @job.cancelled!
        GarageOwners::JobsMailer.notify_cancellation(job_id: @job.id).deliver
      end

      # Note: here intentionally `.now` is missing; its no mistake
      flash[:notice] = t('.notice')
      render js: "window.location='#{vehicle_owner_jobs_path(current_user)}'"
    end

    private

    def set_job
      @job = current_user.jobs.find(params[:id])
    end
  end
end
