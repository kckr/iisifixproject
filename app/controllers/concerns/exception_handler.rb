module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidRequest < StandardError;
  end

  included do
    unless Rails.application.config.consider_all_requests_local

      rescue_from StandardError,
                  ActionController::UnknownFormat,
                  ActionController::RoutingError,
                  ActionController::UnknownController,
                  ActionController::UnknownFormat,
                  NameError,
                  ActionController::MethodNotAllowed, with: :critical_error_handler
    end
  end

  private

  def critical_error_handler(error)
    log_to_console(error)
    create_issue_in_gitlab(error)
    render 'errors/unauthorized', status: 400, layout: 'static', locals: { error: error }
  end

  def create_issue_in_gitlab(error)
    title = "#{error.class} : #{error.message}"[0..251]

    description = "## Error Message\n"
    description << "```ruby\n"
    description << "#{error.message}\n"
    description << "```\n"

    description << "## Details\n"
    description << "**DateTime**: #{DateTime.now}  \n"
    description << "**TimeZone**: #{Time.zone}  \n"
    description << "**Environment**: #{Rails.env}  \n"
    description << "**UserID**: #{current_user && current_user.id}  \n"
    description << "**UserRole**: #{current_user && current_user.role}  \n"
    description << "**Requested From**: #{request.ip}  \n"
    description << "**Request Referrer URL**: #{request.referrer}  \n"
    description << "**Requested URL**: #{request.url}  \n"

    description << "## Request\n"
    description << "```ruby\n"
    description << "parameters: #{request.filtered_parameters}\n"
    description << "```\n"

    description << "## Session Dump\n"
    description << "```ruby\n"
    description << "#{session_dump}\n"
    description << "```\n"

    description << "## Backtrace\n"
    description << "```ruby\n"
    description << "#{error.backtrace[0..25].join("\n")}\n"
    description << "```\n"

    # TODO Move this task to ActiveJob
    # project_id is integer you get from gitlab for your project
    #  I figured out using
    #    > Gitlab.projects
    #  in rails console after configuring the gem
    #    this gives array of projects, you will get ID for project
    Gitlab.create_issue(ENV['gitlab_issifix_project_id'], title,
                        { description: description, labels: 'System Generated, Bug, Production' })
  end

  def session_dump
    keys = ['_csrf_token', 'session_id', 'warden.user.user.key', 'warden.user.user.session']
    keys.map { |key| "#{key}: #{session[key]}" }.join("\n")
  end

  def log_to_console(error)
    logger.debug '~'.red * 100
    logger.debug '-'.red * 100
    logger.debug "Some Error Occured : #{error.class}".red.bold
    logger.debug '-'.red * 100
    logger.debug error.message
    logger.debug '-'.red * 100
    logger.debug error.backtrace.join("\n")
    logger.debug '-'.red * 100
    logger.debug '~'.red * 100
  end
end
