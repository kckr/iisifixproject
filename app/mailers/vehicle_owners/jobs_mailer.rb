module VehicleOwners
  class JobsMailer < ApplicationMailer
    def notify_completion(job_id:)
      @job = Job.find(job_id)
      @vehicle_owner_id = @job.vehicle_owner.id

      mail to: @job.vehicle_owner.email, subject: 'A job needs your confirmation !!!'
    end

    def notify_initiation(job_id:)
      @job = Job.find(job_id)
      @vehicle_owner_id = @job.vehicle_owner.id

      mail to: @job.vehicle_owner.email, subject: 'You job has been initiated !!!'
    end
  end
end
