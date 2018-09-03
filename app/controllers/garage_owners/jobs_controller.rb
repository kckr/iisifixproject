module GarageOwners
  class JobsController < GarageOwnersController
    include UniqueKeyValidatable[:show]
    before_action :set_job, except: :index

    layout 'master', only: [:index]

    def index
      @active_jobs      = @garage.jobs.active
      @archived_jobs    = @garage.jobs.archived
      @jobs_doing_count = @garage.jobs.doing.count
    end

    def show
    end

    def start
      @job.transaction do
        @job.doing!
        VehicleOwners::JobsMailer.notify_initiation(job_id: @job.id).deliver_now
      end

      # Note: here intentionally `.now` is missing; its no mistake
      flash[:notice] = t('.notice')
      render js: "window.location='#{garage_owner_jobs_path(current_user)}'"
    end

    def complete
      @job.transaction do
        @job.done!
        VehicleOwners::JobsMailer.notify_completion(job_id: @job.id).deliver_now
        send_sms_of_completion_of_(@job)
      end

      # Note: here intentionally `.now` is missing; its no mistake
      flash[:notice] = t('.notice')
      render js: "window.location='#{garage_owner_jobs_path(current_user)}'"
    end

    private

    def set_job
      @job = @garage.jobs.find(params[:id])
    end

    def send_sms_of_completion_of_(job)
      url = vehicle_owner_job_url(vehicle_owner_id: job.vehicle_owner.id,
                                  id:               job.id,
                                  unique_key:       job.vehicle_owner.unique_key)

      SmsHandler.new.send(:to      => job.vehicle_owner.decorate.full_phone_number,
                          :message => t('garage_owners.jobs.send_sms_of_completion_of_job.message',
                                        vo_first_name: job.vehicle_owner.first_name,
                                        garage_name:   job.garage.name,
                                        url:           url))
    end
  end
end
