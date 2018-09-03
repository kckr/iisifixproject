class JobDecorator < Draper::Decorator
  delegate_all

  def status_label
    status_map[status]
  end

  private

  # See http://getbootstrap.com/components/#labels
  def status_map
    {
        Job::StatusPending  => 'label-danger',
        Job::StatusCancelled   => 'label-default',
        Job::StatusDoing => 'label-info',
        Job::StatusDone   => 'label-primary',
        Job::StatusConfirmed  => 'label-success'
    }.with_indifferent_access
  end
end
