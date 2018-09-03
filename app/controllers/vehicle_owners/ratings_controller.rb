module VehicleOwners
  class RatingsController < VehicleOwnersController
    def update
      @job = current_user.jobs.find(params[:job_id])
      @job.transaction do
        @job.confirmed!
        @job.create_rating(rating_params) if rating_params[:star_count].present?
        GarageOwners::JobsMailer.notify_confirmation(job_id: @job.id).deliver_now
      end
      flash[:notice] = t('.notice')
      redirect_to vehicle_owner_jobs_path(vehicle_owner_id: current_user.id)
    end

    private

    def rating_params
      params.require(:rating).permit(:star_count,
                                     :company_name,
                                     :job_title,
                                     :testimonial).merge(reviewer: current_user)
    end
  end
end
