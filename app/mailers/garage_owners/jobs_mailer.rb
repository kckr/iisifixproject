module GarageOwners
  class JobsMailer < ApplicationMailer
    def notify_confirmation(job_id:)
      @job = Job.find(job_id)
      garage_owner = @job.garage.owner
      @garage_owner_id = garage_owner.id

      mail to: garage_owner.email, subject: 'Job has been confirmed!!!'
    end

    def notify_cancellation(job_id:)
      @job = Job.find(job_id)
      garage_owner = @job.garage.owner
      @garage_owner_id = garage_owner.id

      mail to: garage_owner.email, subject: 'Job has been cancelled!!!'
    end
  end
end
