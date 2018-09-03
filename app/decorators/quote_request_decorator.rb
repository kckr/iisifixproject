class QuoteRequestDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def report_type
    report&.file&.extension&.downcase || ''
  end

  def status_label
    status_map[status]
  end

  private

  # See http://getbootstrap.com/components/#labels
  def status_map
    {
        QuoteRequest::StatusReponded  => 'label-warning',
        QuoteRequest::StatusPending   => 'label-info',
        QuoteRequest::StatusCancelled => 'label-default',
        QuoteRequest::StatusNotSent   => 'label-default',
        QuoteRequest::StatusRejected  => 'label-danger',
        QuoteRequest::StatusIgnored   => 'label-info',
        QuoteRequest::StatusAccepted  => 'label-primary'
    }.with_indifferent_access
  end
end
