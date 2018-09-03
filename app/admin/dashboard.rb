# Gets formatted data for Charts in _sidebar.slim
def statuses_data(klass)
  klass.group(:status).count.map { |x, y| [x.titleize, y] }.to_h
end

def data_on_trend(klass)
  [{ name: klass.name.underscore.humanize.titleize, data: klass.group_by_day(:created_at, last: 45).count }]
end

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  sidebar :help do
    render 'sidebar'
  end

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      render 'line_chart' # line_chart QuoteRequest.group(:created_at).count
    end
  end # content
end
